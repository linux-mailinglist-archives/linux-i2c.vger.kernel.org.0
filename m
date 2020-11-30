Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12FE72C892C
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 17:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgK3QSH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 11:18:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60046 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728516AbgK3QSG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 11:18:06 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AC8DB26;
        Mon, 30 Nov 2020 17:17:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606753044;
        bh=3taGhS4xl0fseEOGwjEi2DvwtZic9ACqLVYKNXWum3A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aJkKuFFeoldYhqq1HjKPSMh2UfkVU/7PpAUQJjCPXBCSR++IFYmP+8zqQvIo26pD4
         3WYTbxpWhCdI5SGkqmfbjlY3FVrjGi7JOZ+h++5tXm8Puub5ADbMjvwzZ9dw5GotND
         CIWDTeNcASEF8UEpeA4MpXbOAZ6jmDeTWdkYDtRI=
Date:   Mon, 30 Nov 2020 18:17:16 +0200
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
Subject: Re: [PATCH 06/18] software_node: amend
 software_node_unregister_node_group() to perform unregistration of array in
 reverse order to be consistent with software_node_unregister_nodes()
Message-ID: <20201130161716.GJ14465@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-7-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-7-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

The subject line is very long. We try to keep it within a 72 characters
limit in the kernel. That can be a challenge sometimes, and expections
can be accepted, but this one is reaaaally long.

(The same comment holds for other patches in the series)

On Mon, Nov 30, 2020 at 01:31:17PM +0000, Daniel Scally wrote:
> To maintain consistency with software_node_unregister_nodes(), reverse
> the order in which the software_node_unregister_node_group() function
> unregisters nodes.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

I"d squash this with the previous patch to avoid introducing an
inconsistency.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes since v3:
> 
> 	Patch introduced
> 
>  drivers/base/swnode.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index d39e1c76d98d..9bd0bb77ad5b 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -782,7 +782,10 @@ void software_node_unregister_node_group(const struct software_node **node_group
>  	if (!node_group)
>  		return;
>  
> -	for (i = 0; node_group[i]; i++)
> +	while (node_group[i]->name)
> +		i++;
> +
> +	while (i--)
>  		software_node_unregister(node_group[i]);
>  }
>  EXPORT_SYMBOL_GPL(software_node_unregister_node_group);

-- 
Regards,

Laurent Pinchart
