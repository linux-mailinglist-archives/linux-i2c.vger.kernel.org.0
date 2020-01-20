Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A13142E08
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 15:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgATOvL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 09:51:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:42442 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726642AbgATOvL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Jan 2020 09:51:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 91FE9B1E5;
        Mon, 20 Jan 2020 14:51:09 +0000 (UTC)
Date:   Mon, 20 Jan 2020 15:51:07 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/26] docs: i2c: smbus-protocol: fix kernel-doc
 function syntax
Message-ID: <20200120155107.1b3d5e86@endymion>
In-Reply-To: <20200105225012.11701-16-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-16-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun,  5 Jan 2020 23:50:02 +0100, Luca Ceresoli wrote:
> This clarifies these are functions (and would/will adds a hyperlink to the
> function documentation if/when documented).
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/smbus-protocol.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
> index 997945e90419..3c0fb3a2044d 100644
> --- a/Documentation/i2c/smbus-protocol.rst
> +++ b/Documentation/i2c/smbus-protocol.rst
> @@ -118,7 +118,7 @@ byte. But this time, the data is a complete word (16 bits)::
>  
>  Functionality flag: I2C_FUNC_SMBUS_READ_WORD_DATA
>  
> -Note the convenience function i2c_smbus_read_word_swapped is
> +Note the convenience function i2c_smbus_read_word_swapped() is
>  available for reads where the two data bytes are the other way
>  around (not SMBus compliant, but very popular.)
>  
> @@ -152,7 +152,7 @@ specified through the Comm byte.::
>  
>  Functionality flag: I2C_FUNC_SMBUS_WRITE_WORD_DATA
>  
> -Note the convenience function i2c_smbus_write_word_swapped is
> +Note the convenience function i2c_smbus_write_word_swapped() is
>  available for writes where the two data bytes are the other way
>  around (not SMBus compliant, but very popular.)
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>


-- 
Jean Delvare
SUSE L3 Support
