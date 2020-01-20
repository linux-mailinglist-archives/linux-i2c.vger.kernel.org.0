Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A85B142D00
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 15:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgATORA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 09:17:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:53248 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726982AbgATORA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Jan 2020 09:17:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 9F57EACD7;
        Mon, 20 Jan 2020 14:16:58 +0000 (UTC)
Date:   Mon, 20 Jan 2020 15:16:57 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/26] docs: i2c: smbus-protocol: properly name start
 and stop conditions
Message-ID: <20200120151657.50725d9e@endymion>
In-Reply-To: <20200105225012.11701-12-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-12-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun,  5 Jan 2020 23:49:58 +0100, Luca Ceresoli wrote:
> In I2C there is no such thing as a "start bit" or a "stop bit". Use the
> proper naming: "start condition" and "stop condition".
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/smbus-protocol.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
> index 1600b09ec0be..8510eeda1dd0 100644
> --- a/Documentation/i2c/smbus-protocol.rst
> +++ b/Documentation/i2c/smbus-protocol.rst
> @@ -35,8 +35,8 @@ Key to symbols
>  ==============
>  
>  =============== =============================================================
> -S     (1 bit) : Start bit
> -P     (1 bit) : Stop bit
> +S             : Start condition
> +P             : Stop condition
>  Rd/Wr (1 bit) : Read/Write bit. Rd equals 1, Wr equals 0.
>  A, NA (1 bit) : Accept and reverse accept bit.
>  Addr  (7 bits): I2C 7 bit address. Note that this can be expanded as usual to

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
