Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7C043D38
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbfFMPk3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:40:29 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40806 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731901AbfFMJw4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 05:52:56 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E37B725AD8B;
        Thu, 13 Jun 2019 19:52:53 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E9137940483; Thu, 13 Jun 2019 11:52:50 +0200 (CEST)
Date:   Thu, 13 Jun 2019 11:52:50 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 23/34] power: supply: rt9455_charger: simplify getting
 the adapter of a client
Message-ID: <20190613095250.ddho6vwgooksljmm@verge.net.au>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-24-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608105619.593-24-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 08, 2019 at 12:56:02PM +0200, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
> Please apply to your subsystem tree.
> 
>  drivers/power/supply/rt9455_charger.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/supply/rt9455_charger.c b/drivers/power/supply/rt9455_charger.c
> index 40a9d329418a..29161ae90245 100644
> --- a/drivers/power/supply/rt9455_charger.c
> +++ b/drivers/power/supply/rt9455_charger.c
> @@ -1584,7 +1584,7 @@ static const struct regmap_config rt9455_regmap_config = {
>  static int rt9455_probe(struct i2c_client *client,
>  			const struct i2c_device_id *id)
>  {
> -	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> +	struct i2c_adapter *adapter = client->adapter;
>  	struct device *dev = &client->dev;
>  	struct rt9455_info *info;
>  	struct power_supply_config rt9455_charger_config = {};
> -- 
> 2.19.1
> 
