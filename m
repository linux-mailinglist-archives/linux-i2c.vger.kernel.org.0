Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B938158E27
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Feb 2020 13:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgBKMPf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Feb 2020 07:15:35 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36641 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727805AbgBKMPf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Feb 2020 07:15:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48H1v86MR5z9sRR;
        Tue, 11 Feb 2020 23:15:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1581423333;
        bh=nfIHWvxD1KXgZayLaDPdRduSASGIy1jBmLpNhsQMQOY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=JDvmOMq5dj0TejzEIA8r2RgJbIu9D2vCzDwraAhiTwJnRHu+4JU3h1Z4qhb0w0oy+
         /eNplDF/yYViIH/K9rUeZQioSaSCo//Wj/6XVovSgHX5UkjGk/aFGNAB0NUelHGDRa
         GdMdhkjjQ2dlrho8aJMvfgnCQUoaiN2YThiFF3XZDQtBGqpQAi0bVXxz15JAd4/Ir/
         2siNeAUWm6TGTRqBfTT2FU44rdRGcFNSYF/EDRxmbPbczzus73uLVnrUYhFzgrOy+o
         qCrj5ZtMsWG5T6T3DRgcmNZQeR/8XcOOtJqnlJRV3y8jKDP0XkatSSrslValrN0Z7t
         241iD3ZC1xbBg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linuxppc-dev@lists.ozlabs.org
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH RESEND] macintosh: convert to i2c_new_scanned_device
In-Reply-To: <20200210170401.5357-1-wsa+renesas@sang-engineering.com>
References: <20200210170401.5357-1-wsa+renesas@sang-engineering.com>
Date:   Tue, 11 Feb 2020 23:15:17 +1100
Message-ID: <87ftfhz5ey.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). No functional change for this driver because
> it doesn't check the return code anyhow.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> I can take this via I2C tree if this makes things easier...

Yes please. Sorry I missed it before.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

>  drivers/macintosh/therm_windtunnel.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/macintosh/therm_windtunnel.c b/drivers/macintosh/therm_windtunnel.c
> index 8c744578122a..f15fec5e1cb6 100644
> --- a/drivers/macintosh/therm_windtunnel.c
> +++ b/drivers/macintosh/therm_windtunnel.c
> @@ -321,10 +321,10 @@ do_attach( struct i2c_adapter *adapter )
>  
>  		memset(&info, 0, sizeof(struct i2c_board_info));
>  		strlcpy(info.type, "therm_ds1775", I2C_NAME_SIZE);
> -		i2c_new_probed_device(adapter, &info, scan_ds1775, NULL);
> +		i2c_new_scanned_device(adapter, &info, scan_ds1775, NULL);
>  
>  		strlcpy(info.type, "therm_adm1030", I2C_NAME_SIZE);
> -		i2c_new_probed_device(adapter, &info, scan_adm1030, NULL);
> +		i2c_new_scanned_device(adapter, &info, scan_adm1030, NULL);
>  
>  		if( x.thermostat && x.fan ) {
>  			x.running = 1;
> -- 
> 2.20.1
