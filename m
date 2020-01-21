Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEB24143941
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2020 10:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbgAUJQq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jan 2020 04:16:46 -0500
Received: from mx2.suse.de ([195.135.220.15]:59126 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgAUJQq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jan 2020 04:16:46 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 198EABB09;
        Tue, 21 Jan 2020 09:16:44 +0000 (UTC)
Date:   Tue, 21 Jan 2020 10:16:37 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/26] docs: i2c: smbus-protocol: improve I2C Block
 transactions description
Message-ID: <20200121101637.07513417@endymion>
In-Reply-To: <20200105225012.11701-19-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-19-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun,  5 Jan 2020 23:50:05 +0100, Luca Ceresoli wrote:
> Clarify from the beginning what these transactions are, and specifically
> how they differ from the SMBus counterparts, i.e. the lack of a Count byte.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/smbus-protocol.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
> index 7350e4b2c2fa..0edaf6069ac1 100644
> --- a/Documentation/i2c/smbus-protocol.rst
> +++ b/Documentation/i2c/smbus-protocol.rst
> @@ -282,9 +282,10 @@ This is implemented the following way in the Linux kernel:
>  I2C Block Transactions
>  ======================
>  
> -The following I2C block transactions are supported by the
> -SMBus layer and are described here for completeness.
> -They are *NOT* defined by the SMBus specification.
> +The following I2C block transactions are similar to the SMBus Block Read
> +and Write operations, except these do not have a Count byte. They are
> +supported by the SMBus layer and are described here for completeness, but
> +they are *NOT* defined by the SMBus specification.
>  
>  I2C block transactions do not limit the number of bytes transferred
>  but the SMBus layer places a limit of 32 bytes.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
