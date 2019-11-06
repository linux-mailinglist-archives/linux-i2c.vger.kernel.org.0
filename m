Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A43F3F14DC
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 12:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729506AbfKFLTt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 06:19:49 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:36077 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726101AbfKFLTt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Nov 2019 06:19:49 -0500
Received: from [IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a]
 ([IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a])
        by smtp-cloud8.xs4all.net with ESMTPA
        id SJLkiPQL3TzKrSJLniy8wY; Wed, 06 Nov 2019 12:19:47 +0100
Subject: Re: [RFC PATCH 09/12] media: pci: bt8xx: convert to
 i2c_new_scanned_device
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-10-wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f5b078aa-73c7-993a-7221-98962a13ab23@xs4all.nl>
Date:   Wed, 6 Nov 2019 12:19:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191106095033.25182-10-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK9iv53HHXI8NT51FPYsb7RzPKOQpkQhkuOaetxFEO0i9Wm7OYD7drgCRS7yoA3R3+va0l4u01M4KGbDNMJwCgt6JYNkRJ2GNq24d2uN7U+BnlWjwLLT
 4jx090EW8mBx/cyqWnFZTlwTHp52LG+5vYbZmG/Pu1U/SiPRA12JmP3GwF9rW8EzswWhHhpoeODvSeBxPmmmaiOZ4w4EVUbTQCndria/tLBCiEH34xIJng+E
 epIyZNFEZ2HZWsAPftf5dxCnNBLatkNBze2owe9cZrPHbbv5yDLJ4crQ771CMRqrx468I/DFMylqGStxtku4qFqvC70MeCHOmnG6oKSIbk8IFEqR7g85Ag1r
 zAHXp9chin86YsFrMi6O10cCJEL4jDkH15VIANum6BURlcdWQOnyQGjcA+IFvnIo2/pt/f1As34a4U5KP+xxym51Wx7UEw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/6/19 10:50 AM, Wolfram Sang wrote:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
> 
> Build tested only. RFC, please comment and/or ack, but don't apply yet.
> 
>  drivers/media/pci/bt8xx/bttv-input.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/bt8xx/bttv-input.c b/drivers/media/pci/bt8xx/bttv-input.c
> index 492bc85c2700..41226f1d0e5b 100644
> --- a/drivers/media/pci/bt8xx/bttv-input.c
> +++ b/drivers/media/pci/bt8xx/bttv-input.c
> @@ -386,7 +386,7 @@ void init_bttv_i2c_ir(struct bttv *btv)
>  
>  	if (btv->init_data.name) {
>  		info.platform_data = &btv->init_data;
> -		i2c_dev = i2c_new_device(&btv->c.i2c_adap, &info);
> +		i2c_dev = i2c_new_client_device(&btv->c.i2c_adap, &info);
>  	} else {
>  		/*
>  		 * The external IR receiver is at i2c address 0x34 (0x35 for
> @@ -396,9 +396,9 @@ void init_bttv_i2c_ir(struct bttv *btv)
>  		 * internal.
>  		 * That's why we probe 0x1a (~0x34) first. CB
>  		 */
> -		i2c_dev = i2c_new_probed_device(&btv->c.i2c_adap, &info, addr_list, NULL);
> +		i2c_dev = i2c_new_scanned_device(&btv->c.i2c_adap, &info, addr_list, NULL);
>  	}
> -	if (NULL == i2c_dev)
> +	if (IS_ERR(i2c_dev))
>  		return;
>  
>  #if defined(CONFIG_MODULES) && defined(MODULE)
> 

