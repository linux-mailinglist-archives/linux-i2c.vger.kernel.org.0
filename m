Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27BE2F14DB
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 12:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbfKFLTC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 06:19:02 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:42145 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731505AbfKFLTC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Nov 2019 06:19:02 -0500
Received: from [IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a]
 ([IPv6:2001:420:44c1:2577:dd0c:75f0:7ccb:ac5a])
        by smtp-cloud8.xs4all.net with ESMTPA
        id SJKyiPPxzTzKrSJL1iy8f1; Wed, 06 Nov 2019 12:18:59 +0100
Subject: Re: [RFC PATCH 07/12] media: pci: cx23885: convert to
 i2c_new_scanned_device
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-8-wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f22a6c45-2015-ba78-7dce-f7b2ad3f7740@xs4all.nl>
Date:   Wed, 6 Nov 2019 12:18:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191106095033.25182-8-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDTKaih6xo4LBYUWkwtRcnvQho0YCWdIlndtX4LLEql08yg8OhYpKYE27eHsvlAHyNhPcKvo1ixdPEBiwpu6T8SG2NOMuSjHgwRnsVy1SqkZ/OATTxeO
 8Hb5vNF3H20+n14cnoZZBtibF/7aTONmgp4plM2Due4DLV39T6Qh/yHy9l35jxXWBt3a1G7AnEUyt9jPTe9J1UlFpZb9kVjkb11nLxrU5c56YV9UkFdqs7fO
 MB7zAgePVU88A9ktuqqYClAEGhfMLJs+R7JVt3Pp4cd1/AA9tLG1G2TrHqyhamGQhh7xXa6PGfhZ4uLUrl8uIuG1m/uXD2u9qtyFTSXGvWhlFYt+g4+MtFX4
 +DQBhmwOXJujDY6aLk5cYtPeATi7xY8n474E8FvFBF3ZdCStdE3P8R4G0NujUnoN2BA0cL5mtPlXOCLeAb684Hj2yEpaAg==
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
>  drivers/media/pci/cx23885/cx23885-i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/cx23885/cx23885-i2c.c b/drivers/media/pci/cx23885/cx23885-i2c.c
> index 4f327ee9659e..f51fad33dc04 100644
> --- a/drivers/media/pci/cx23885/cx23885-i2c.c
> +++ b/drivers/media/pci/cx23885/cx23885-i2c.c
> @@ -337,8 +337,8 @@ int cx23885_i2c_register(struct cx23885_i2c *bus)
>  		strscpy(info.type, "ir_video", I2C_NAME_SIZE);
>  		/* Use quick read command for probe, some IR chips don't
>  		 * support writes */
> -		i2c_new_probed_device(&bus->i2c_adap, &info, addr_list,
> -				      i2c_probe_func_quick_read);
> +		i2c_new_scanned_device(&bus->i2c_adap, &info, addr_list,
> +				       i2c_probe_func_quick_read);
>  	}
>  
>  	return bus->i2c_rc;
> 

