Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C636C142D7B
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 15:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbgATO0G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 09:26:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:57652 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgATO0G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Jan 2020 09:26:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 61118AAD0;
        Mon, 20 Jan 2020 14:26:04 +0000 (UTC)
Date:   Mon, 20 Jan 2020 15:26:03 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/26] docs: i2c: smbus-protocol: use proper names for
 ACK and NACK
Message-ID: <20200120152603.12a81fe1@endymion>
In-Reply-To: <20200105225012.11701-14-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-14-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun,  5 Jan 2020 23:50:00 +0100, Luca Ceresoli wrote:
> Use the proper ACK and NACK naming from the I2C specification instead of
> "accept" and "reverse accept".
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/smbus-protocol.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
> index fbadd4d25ad5..10c4a989982c 100644
> --- a/Documentation/i2c/smbus-protocol.rst
> +++ b/Documentation/i2c/smbus-protocol.rst
> @@ -38,7 +38,7 @@ Key to symbols
>  S               Start condition
>  P               Stop condition
>  Rd/Wr (1 bit)   Read/Write bit. Rd equals 1, Wr equals 0.
> -A, NA (1 bit)   Accept and reverse accept bit.
> +A, NA (1 bit)   Acknowledge (ACK) and Not Acknowledge (NACK) bit
>  Addr  (7 bits)  I2C 7 bit address. Note that this can be expanded as usual to
>                  get a 10 bit I2C address.
>  Comm  (8 bits)  Command byte, a data byte which often selects a register on

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
