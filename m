Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38137142DEC
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 15:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbgATOor (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 09:44:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:38544 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgATOor (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Jan 2020 09:44:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id CC8EAB15B;
        Mon, 20 Jan 2020 14:44:45 +0000 (UTC)
Date:   Mon, 20 Jan 2020 15:44:44 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/26] docs: i2c: smbus-protocol: enable kernel-doc
 function syntax
Message-ID: <20200120154444.7c1d3863@endymion>
In-Reply-To: <20200105225012.11701-15-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-15-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun,  5 Jan 2020 23:50:01 +0100, Luca Ceresoli wrote:
> Hyperlinks from function names are not generated in headings. Move them in
> the plain text so they are rendered as clickable hyerlinks.

typo: hyperlinks

> 
> While there also remove an unneeded colon in a heading.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/smbus-protocol.rst | 64 ++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
> index 10c4a989982c..997945e90419 100644
> --- a/Documentation/i2c/smbus-protocol.rst
> +++ b/Documentation/i2c/smbus-protocol.rst
> @@ -62,8 +62,10 @@ This sends a single bit to the device, at the place of the Rd/Wr bit::
>  Functionality flag: I2C_FUNC_SMBUS_QUICK
>  
>  
> -SMBus Receive Byte:  i2c_smbus_read_byte()
> -==========================================
> +SMBus Receive Byte
> +==================
> +
> +Implemented by i2c_smbus_read_byte()

In file i2c-protocol.rst, the wording used is:

This corresponds to i2c_transfer().

For consistency, can we settle for "Implemented by foo()" everywhere?

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
