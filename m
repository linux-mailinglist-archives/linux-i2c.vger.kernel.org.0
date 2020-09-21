Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC881271BA9
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 09:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgIUHVj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 03:21:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:49362 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726244AbgIUHVj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 03:21:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A5AAAAF31;
        Mon, 21 Sep 2020 07:22:14 +0000 (UTC)
Date:   Mon, 21 Sep 2020 09:21:37 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] misc: eeprom: use helper to get i2c_client from kobj
Message-ID: <20200921092137.3f05d088@endymion>
In-Reply-To: <20200919065615.4939-1-wsa+renesas@sang-engineering.com>
References: <20200919065615.4939-1-wsa+renesas@sang-engineering.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 19 Sep 2020 08:56:15 +0200, Wolfram Sang wrote:
> Slightly easier to read.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/misc/eeprom/eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/eeprom/eeprom.c b/drivers/misc/eeprom/eeprom.c
> index 226b5efa6a77..34fa385dfd4b 100644
> --- a/drivers/misc/eeprom/eeprom.c
> +++ b/drivers/misc/eeprom/eeprom.c
> @@ -76,7 +76,7 @@ static ssize_t eeprom_read(struct file *filp, struct kobject *kobj,
>  			   struct bin_attribute *bin_attr,
>  			   char *buf, loff_t off, size_t count)
>  {
> -	struct i2c_client *client = to_i2c_client(kobj_to_dev(kobj));
> +	struct i2c_client *client = kobj_to_i2c_client(kobj);
>  	struct eeprom_data *data = i2c_get_clientdata(client);
>  	u8 slice;
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
