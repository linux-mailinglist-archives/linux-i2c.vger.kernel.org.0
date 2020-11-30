Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1C62C8555
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgK3NdT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgK3NdS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:33:18 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900AEC061A47;
        Mon, 30 Nov 2020 05:32:04 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id f190so22147865wme.1;
        Mon, 30 Nov 2020 05:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v9hgkB45IAZvjm6wECtiA2RMiJReOpFXi8K4dGY5xEQ=;
        b=lBnhvpDR2OZilI5L1ubpeo4iuPqpqH1Xu/JaFgzgEkEpP+8cln503R/aEyo9lrCPz0
         ZJK9Rae/iklw+x7E/+LJBE8tpd+PlZTK4mkth98JPSiUMwzVJyRo98+fZnwRHAfC6z16
         gyQ+jRUrLYk2wo758TK7XuqFwG6Wp9fDzG8GePKFFeVhDQsZ1GIXRqAujU/ZzRl25Kdt
         Wo3HmXrTS3VGBclLstUuDBIRhk7rzyFhZaRDr4fb9RruJPUWkF5eTN7d4KogVnzt7rA0
         zKs0K/iXyGP4E14Qt6BdMjoPrJMcS8bVib6bXm6G9ScTmQUM+SKHOitCnQahrvkcEP0u
         nZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v9hgkB45IAZvjm6wECtiA2RMiJReOpFXi8K4dGY5xEQ=;
        b=E5Bjy7AYaY/lasTJEmtVr05Cif/PYNXJqfvZnkuXUlNQcpPZpV5UONXQLpzc32Y5qo
         gUWctFO9mBHNt0LPOYwl+8N6lrAfZktBbPYM1nXRA2LXYrAjbrn2VSQYxPo9XZGpG+LQ
         A5twWWtwQgFB1scmU5wOnfRaa7xPyjmRqODe4nomSvZa0Y0Is5OyCEoTN8zpaE9aoeSx
         kic61ossUnmJEgtqtn1P4hPHZY9TCQILoKOjykmcvP3GEqwH7iMk/Cc/joilXVU//aGL
         SBf9T8tfi2eOXXJl0U79xPh5rlNISVWw+OXNX+oWIDgimRLswfKjXTGSA+9u2Dj5hUZ7
         9i6Q==
X-Gm-Message-State: AOAM533hOd8tK6/YCgtnjRzwkZg0tF5PS56NgD9ClkeAPO8jFyP2IkWe
        RZZczE+1BUePZhbFGq3ULIOThxIs3y3iIiuW
X-Google-Smtp-Source: ABdhPJwoVt5eH9bGJUi3K8IZN8T56R8RDLI8GHjsiwuH8QBPp1iY9Z0IPNQD/xZFbvLY38CW9Gq4wg==
X-Received: by 2002:a05:600c:229a:: with SMTP id 26mr23827131wmf.100.1606743122966;
        Mon, 30 Nov 2020 05:32:02 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:32:02 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, gregkh@linuxfoundation.org,
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
Subject: [PATCH 07/18] software_node: Add support for fwnode_graph*() family of functions
Date:   Mon, 30 Nov 2020 13:31:18 +0000
Message-Id: <20201130133129.1024662-8-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

This implements the remaining .graph_* callbacks in the
fwnode operations vector for the software nodes. That makes
the fwnode_graph*() functions available in the drivers also
when software nodes are used.

The implementation tries to mimic the "OF graph" as much as
possible, but there is no support for the "reg" device
property. The ports will need to have the index in their
name which starts with "port" (for example "port0", "port1",
...) and endpoints will use the index of the software node
that is given to them during creation. The port nodes can
also be grouped under a specially named "ports" subnode,
just like in DT, if necessary.

The remote-endpoints are reference properties under the
endpoint nodes that are named "remote-endpoint".

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Co-developed-by: Daniel Scally <djrscally@gmail.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
changes since RFC v3:
	- Simplified software_node_get_next_endpoint() a little
	- Squared away references in software_node_get_next_endpoint()
	and swnode_graph_find_next_port(), since they were affected by
	the change to the earlier patch that had *get_next_child() also
	put the previous reference.
	- Dropped Andy's R-b, since the code changed.
changes in RFC v3:
	- removed software_node_device_is_available
	- moved the change to software_node_get_next_child to a separate
	patch
	- switched to use fwnode_handle_put() in graph_get_next_endpoint()
	instead of software_node_put()

changes in RFC v2:
	- added software_node_device_is_available
	- altered software_node_get_next_child to get references
	- altered software_node_get_next_endpoint to release references
	to ports and avoid passing invalid combinations of swnodes to
	software_node_get_next_child
	- altered swnode_graph_find_next_port to release port rather than
	old

 drivers/base/swnode.c | 110 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 9bd0bb77ad5b..0c7a8d6b9ea8 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -540,6 +540,110 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static struct fwnode_handle *
+swnode_graph_find_next_port(const struct fwnode_handle *parent,
+			    struct fwnode_handle *port)
+{
+	struct fwnode_handle *old = port;
+
+	while ((port = software_node_get_next_child(parent, old))) {
+		if (!strncmp(to_swnode(port)->node->name, "port", 4))
+			return port;
+		old = port;
+	}
+
+	return NULL;
+}
+
+static struct fwnode_handle *
+software_node_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
+				      struct fwnode_handle *endpoint)
+{
+	struct swnode *swnode = to_swnode(fwnode);
+	struct fwnode_handle *old = endpoint;
+	struct fwnode_handle *parent;
+	struct fwnode_handle *port;
+
+	if (!swnode)
+		return NULL;
+
+	if (endpoint) {
+		port = software_node_get_parent(endpoint);
+		parent = software_node_get_parent(port);
+	} else {
+		parent = software_node_get_named_child_node(fwnode, "ports");
+		if (!parent)
+			parent = software_node_get(&swnode->fwnode);
+
+		port = swnode_graph_find_next_port(parent, NULL);
+	}
+
+	for (; port; port = swnode_graph_find_next_port(parent, port)) {
+		endpoint = software_node_get_next_child(port, old);
+		if (endpoint) {
+			fwnode_handle_put(port);
+			break;
+		}
+
+		/* No more endpoints for that port, so stop passing old */
+		old = NULL;
+	}
+
+	fwnode_handle_put(parent);
+
+	return endpoint;
+}
+
+static struct fwnode_handle *
+software_node_graph_get_remote_endpoint(const struct fwnode_handle *fwnode)
+{
+	struct swnode *swnode = to_swnode(fwnode);
+	const struct software_node_ref_args *ref;
+	const struct property_entry *prop;
+
+	if (!swnode)
+		return NULL;
+
+	prop = property_entry_get(swnode->node->properties, "remote-endpoint");
+	if (!prop || prop->type != DEV_PROP_REF || prop->is_inline)
+		return NULL;
+
+	ref = prop->pointer;
+
+	return software_node_get(software_node_fwnode(ref[0].node));
+}
+
+static struct fwnode_handle *
+software_node_graph_get_port_parent(struct fwnode_handle *fwnode)
+{
+	struct swnode *swnode = to_swnode(fwnode);
+	struct fwnode_handle *parent;
+
+	if (!strcmp(swnode->parent->node->name, "ports"))
+		parent = &swnode->parent->parent->fwnode;
+	else
+		parent = &swnode->parent->fwnode;
+
+	return software_node_get(parent);
+}
+
+static int
+software_node_graph_parse_endpoint(const struct fwnode_handle *fwnode,
+				   struct fwnode_endpoint *endpoint)
+{
+	struct swnode *swnode = to_swnode(fwnode);
+	int ret;
+
+	ret = kstrtou32(swnode->parent->node->name + 4, 10, &endpoint->port);
+	if (ret)
+		return ret;
+
+	endpoint->id = swnode->id;
+	endpoint->local_fwnode = fwnode;
+
+	return 0;
+}
+
 static const struct fwnode_operations software_node_ops = {
 	.get = software_node_get,
 	.put = software_node_put,
@@ -551,7 +655,11 @@ static const struct fwnode_operations software_node_ops = {
 	.get_parent = software_node_get_parent,
 	.get_next_child_node = software_node_get_next_child,
 	.get_named_child_node = software_node_get_named_child_node,
-	.get_reference_args = software_node_get_reference_args
+	.get_reference_args = software_node_get_reference_args,
+	.graph_get_next_endpoint = software_node_graph_get_next_endpoint,
+	.graph_get_remote_endpoint = software_node_graph_get_remote_endpoint,
+	.graph_get_port_parent = software_node_graph_get_port_parent,
+	.graph_parse_endpoint = software_node_graph_parse_endpoint,
 };
 
 /* -------------------------------------------------------------------------- */
-- 
2.25.1

