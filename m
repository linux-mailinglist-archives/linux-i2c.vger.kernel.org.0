Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203152C8918
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 17:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728646AbgK3QNa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 11:13:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59944 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727805AbgK3QN3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 11:13:29 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3196EB26;
        Mon, 30 Nov 2020 17:12:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606752767;
        bh=XHWQSAsrh9m4hW3O3jEWcf9HH4f/EYgK0dYt8NjBlo8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ELrl+J7AWtszvCpabBFCOD0BULItsZ/S271Szi1gcf09hdI3v36uXmZHVeAv5YABY
         emka19o8WCk0oBdHavEIqIJe9yins0OB8aVYnsTOmAVjmXX59J8jG1I0uwlZXL8RAj
         IoaGa2DHw5rhFMpwXYguIjmsw02L9u0l8R6AGnIA=
Date:   Mon, 30 Nov 2020 18:12:39 +0200
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
Subject: Re: [PATCH 04/18] software_node: Enforce parent before child
 ordering of nodes array for software_node_register_nodes()
Message-ID: <20201130161239.GH14465@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-5-djrscally@gmail.com>
 <20201130161152.GG14465@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130161152.GG14465@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 06:11:52PM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> On Mon, Nov 30, 2020 at 01:31:15PM +0000, Daniel Scally wrote:
> > Registering software_nodes with the .parent member set to point to a
> > currently unregistered software_node has the potential for problems,
> > so enforce parent -> child ordering in arrays passed to this function.
> > 
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Daniel Scally <djrscally@gmail.com>
> > ---
> > Changes since RFC v3:
> > 
> > 	Patch introduced
> > 
> >  drivers/base/swnode.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> > index 615a0c93e116..af7930b3679e 100644
> > --- a/drivers/base/swnode.c
> > +++ b/drivers/base/swnode.c
> > @@ -700,14 +700,21 @@ int software_node_register_nodes(const struct software_node *nodes)
> >  	int i;
> >  
> >  	for (i = 0; nodes[i].name; i++) {
> > +		if (nodes[i].parent)
> > +			if (!software_node_to_swnode(nodes[i].parent)) {
> > +				ret = -EINVAL;
> > +				goto err_unregister_nodes;
> > +			}
> > +
> >  		ret = software_node_register(&nodes[i]);
> > -		if (ret) {
> > -			software_node_unregister_nodes(nodes);
> > -			return ret;
> > -		}
> > +		if (ret)
> > +			goto err_unregister_nodes;
> >  	}
> >  
> >  	return 0;
> 
> I'd add a blank line here.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I spoke a bit too soon. Could you update the documentation of the
function to explain this new requirement ?

> > +err_unregister_nodes:
> > +	software_node_unregister_nodes(nodes);
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(software_node_register_nodes);
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,

Laurent Pinchart
