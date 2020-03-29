Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB97F196AD4
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Mar 2020 05:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgC2DTP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Mar 2020 23:19:15 -0400
Received: from cnc.isely.net ([75.149.91.89]:54423 "EHLO cnc.isely.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726315AbgC2DTP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Mar 2020 23:19:15 -0400
X-Greylist: delayed 304 seconds by postgrey-1.27 at vger.kernel.org; Sat, 28 Mar 2020 23:19:14 EDT
Received: from ts3-dock2.isely.net (ts3-dock2.isely.net [::ffff:192.168.23.14])
  (AUTH: PLAIN isely, TLS: TLSv1/SSLv3,256bits,DHE-RSA-AES256-GCM-SHA384)
  by cnc.isely.net with ESMTPSA; Sat, 28 Mar 2020 22:14:09 -0500
  id 0000000000146015.000000005E801281.00004342
Date:   Sat, 28 Mar 2020 22:14:09 -0500 (CDT)
From:   Mike Isely <isely@isely.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
cc:     linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Isely <isely@isely.net>
Subject: Re: [PATCH 6/6] media: usb: pvrusb2: convert to use
 i2c_new_client_device()
In-Reply-To: <20200326210947.12747-7-wsa+renesas@sang-engineering.com>
Message-ID: <alpine.DEB.2.21.2003282213550.11595@sheridan.isely.net>
References: <20200326210947.12747-1-wsa+renesas@sang-engineering.com> <20200326210947.12747-7-wsa+renesas@sang-engineering.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Acked-by: Mike Isely <isely@pobox.com>

On Thu, 26 Mar 2020, Wolfram Sang wrote:

> Move away from the deprecated API.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
> index 275394bafe7d..63db04fe12d3 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
> @@ -564,7 +564,7 @@ static void pvr2_i2c_register_ir(struct pvr2_hdw *hdw)
>  		strscpy(info.type, "ir_video", I2C_NAME_SIZE);
>  		pvr2_trace(PVR2_TRACE_INFO, "Binding %s to i2c address 0x%02x.",
>  			   info.type, info.addr);
> -		i2c_new_device(&hdw->i2c_adap, &info);
> +		i2c_new_client_device(&hdw->i2c_adap, &info);
>  		break;
>  	case PVR2_IR_SCHEME_ZILOG:     /* HVR-1950 style */
>  	case PVR2_IR_SCHEME_24XXX_MCE: /* 24xxx MCE device */
> @@ -579,7 +579,7 @@ static void pvr2_i2c_register_ir(struct pvr2_hdw *hdw)
>  		strscpy(info.type, "ir_z8f0811_haup", I2C_NAME_SIZE);
>  		pvr2_trace(PVR2_TRACE_INFO, "Binding %s to i2c address 0x%02x.",
>  			   info.type, info.addr);
> -		i2c_new_device(&hdw->i2c_adap, &info);
> +		i2c_new_client_device(&hdw->i2c_adap, &info);
>  		break;
>  	default:
>  		/* The device either doesn't support I2C-based IR or we
> 

-- 

Mike Isely
isely @ isely (dot) net
PGP: 03 54 43 4D 75 E5 CC 92 71 16 01 E2 B5 F5 C1 E8
