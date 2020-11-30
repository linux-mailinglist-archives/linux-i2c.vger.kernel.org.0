Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731012C896D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 17:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728744AbgK3Q03 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 11:26:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgK3Q02 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 11:26:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953CFC0613D4;
        Mon, 30 Nov 2020 08:25:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F07EB26;
        Mon, 30 Nov 2020 17:25:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606753546;
        bh=UA/qkxUzYwRKqR3JG9I0EWqhjMCqRovfEci6PpvyszQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BRtt9fHW35gc74uBEncfpTiuQfVpjt1QygOkT5Zk8l8ijokklL6WGy5Dcuv+Cz5ld
         JdPMTUWzPZSzf9XLr4hJ1nPSsAw1qdNd2ykpvQdtiOGs9210M2H9qVCBtoBQOj1/x3
         4MjhMOBM8CSwuTUTdUiAY+ZWstdZO5tTJ9svyFGI=
Date:   Mon, 30 Nov 2020 18:25:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 07/18] software_node: Add support for fwnode_graph*()
 family of functions
Message-ID: <20201130162538.GK14465@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-8-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-8-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel and Heikki,

Thank you for the patch.

On Mon, Nov 30, 2020 at 01:31:18PM +0000, Daniel Scally wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 

There seems to be one From: line too many. You can drop the one in the
commit message, git-format-patch will add it automatically.

> This implements the remaining .graph_* callbacks in the
> fwnode operations vector for the software nodes. That makes

s/vector/structure/ ?

> the fwnode_graph*() functions available in the drivers also
> when software nodes are used.
> 
> The implementation tries to mimic the "OF graph" as much as
> possible, but there is no support for the "reg" device
> property. The ports will need to have the index in their
> name which starts with "port" (for example "port0", "port1",
> ...) and endpoints will use the index of the software node
> that is given to them during creation. The port nodes can
> also be grouped under a specially named "ports" subnode,
> just like in DT, if necessary.

I'm not very familiar with swnodes, but could we name ports port@n
instead of portn to mimic OF nodes ?

> The remote-endpoints are reference properties under the
> endpoint nodes that are named "remote-endpoint".
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Co-developed-by: Daniel Scally <djrscally@gmail.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> changes since RFC v3:
> 	- Simplified software_node_get_next_endpoint() a little
> 	- Squared away references in software_node_get_next_endpoint()
> 	and swnode_graph_find_next_port(), since they were affected by
> 	the change to the earlier patch that had *get_next_child() also
> 	put the previous reference.
> 	- Dropped Andy's R-b, since the code changed.
> changes in RFC v3:
> 	- removed software_node_device_is_available
> 	- moved the change to software_node_get_next_child to a separate
> 	patch
> 	- switched to use fwnode_handle_put() in graph_get_next_endpoint()
> 	instead of software_node_put()
> 
> changes in RFC v2:
> 	- added software_node_device_is_available
> 	- altered software_node_get_next_child to get references
> 	- altered software_node_get_next_endpoint to release references
> 	to ports and avoid passing invalid combinations of swnodes to
> 	software_node_get_next_child
> 	- altered swnode_graph_find_next_port to release port rather than
> 	old
> 
>  drivers/base/swnode.c | 110 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 109 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 9bd0bb77ad5b..0c7a8d6b9ea8 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -540,6 +540,110 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
>  	return 0;
>  }
>  
> +static struct fwnode_handle *
> +swnode_graph_find_next_port(const struct fwnode_handle *parent,
> +			    struct fwnode_handle *port)
> +{
> +	struct fwnode_handle *old = port;
> +
> +	while ((port = software_node_get_next_child(parent, old))) {
> +		if (!strncmp(to_swnode(port)->node->name, "port", 4))
> +			return port;
> +		old = port;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct fwnode_handle *
> +software_node_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
> +				      struct fwnode_handle *endpoint)
> +{
> +	struct swnode *swnode = to_swnode(fwnode);
> +	struct fwnode_handle *old = endpoint;
> +	struct fwnode_handle *parent;
> +	struct fwnode_handle *port;
> +
> +	if (!swnode)
> +		return NULL;
> +
> +	if (endpoint) {
> +		port = software_node_get_parent(endpoint);
> +		parent = software_node_get_parent(port);
> +	} else {
> +		parent = software_node_get_named_child_node(fwnode, "ports");
> +		if (!parent)
> +			parent = software_node_get(&swnode->fwnode);
> +
> +		port = swnode_graph_find_next_port(parent, NULL);
> +	}
> +
> +	for (; port; port = swnode_graph_find_next_port(parent, port)) {
> +		endpoint = software_node_get_next_child(port, old);
> +		if (endpoint) {
> +			fwnode_handle_put(port);
> +			break;
> +		}
> +
> +		/* No more endpoints for that port, so stop passing old */
> +		old = NULL;
> +	}
> +
> +	fwnode_handle_put(parent);
> +
> +	return endpoint;
> +}
> +
> +static struct fwnode_handle *
> +software_node_graph_get_remote_endpoint(const struct fwnode_handle *fwnode)
> +{
> +	struct swnode *swnode = to_swnode(fwnode);
> +	const struct software_node_ref_args *ref;
> +	const struct property_entry *prop;
> +
> +	if (!swnode)
> +		return NULL;
> +
> +	prop = property_entry_get(swnode->node->properties, "remote-endpoint");
> +	if (!prop || prop->type != DEV_PROP_REF || prop->is_inline)
> +		return NULL;
> +
> +	ref = prop->pointer;
> +
> +	return software_node_get(software_node_fwnode(ref[0].node));
> +}
> +
> +static struct fwnode_handle *
> +software_node_graph_get_port_parent(struct fwnode_handle *fwnode)
> +{
> +	struct swnode *swnode = to_swnode(fwnode);
> +	struct fwnode_handle *parent;
> +
> +	if (!strcmp(swnode->parent->node->name, "ports"))
> +		parent = &swnode->parent->parent->fwnode;
> +	else
> +		parent = &swnode->parent->fwnode;
> +
> +	return software_node_get(parent);
> +}
> +
> +static int
> +software_node_graph_parse_endpoint(const struct fwnode_handle *fwnode,
> +				   struct fwnode_endpoint *endpoint)
> +{
> +	struct swnode *swnode = to_swnode(fwnode);
> +	int ret;
> +
> +	ret = kstrtou32(swnode->parent->node->name + 4, 10, &endpoint->port);

If we use port@, s/4/5/. But I suppose we also want to support the case
where a single port is used, with its name set to "port" ? The logic
would then need to be a tad more complex. Not sure if the consistency is
worth the additional complexity, up to you.

> +	if (ret)
> +		return ret;
> +
> +	endpoint->id = swnode->id;
> +	endpoint->local_fwnode = fwnode;
> +
> +	return 0;
> +}
> +
>  static const struct fwnode_operations software_node_ops = {
>  	.get = software_node_get,
>  	.put = software_node_put,
> @@ -551,7 +655,11 @@ static const struct fwnode_operations software_node_ops = {
>  	.get_parent = software_node_get_parent,
>  	.get_next_child_node = software_node_get_next_child,
>  	.get_named_child_node = software_node_get_named_child_node,
> -	.get_reference_args = software_node_get_reference_args
> +	.get_reference_args = software_node_get_reference_args,
> +	.graph_get_next_endpoint = software_node_graph_get_next_endpoint,
> +	.graph_get_remote_endpoint = software_node_graph_get_remote_endpoint,
> +	.graph_get_port_parent = software_node_graph_get_port_parent,
> +	.graph_parse_endpoint = software_node_graph_parse_endpoint,
>  };
>  
>  /* -------------------------------------------------------------------------- */

-- 
Regards,

Laurent Pinchart
