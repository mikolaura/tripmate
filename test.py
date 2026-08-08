import asyncio
from mcp_client import aviation_mcp_call, get_all_tools

if __name__ == "__main__":
    print(asyncio.run(get_all_tools()))
