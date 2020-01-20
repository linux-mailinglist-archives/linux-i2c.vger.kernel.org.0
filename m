Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCB0C142E98
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 16:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbgATPQO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 10:16:14 -0500
Received: from mx2.suse.de ([195.135.220.15]:54736 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726942AbgATPQO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Jan 2020 10:16:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id AC927B029;
        Mon, 20 Jan 2020 15:16:12 +0000 (UTC)
Date:   Mon, 20 Jan 2020 16:16:11 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/26] docs: i2c: i2c-protocol: fix punctuation
Message-ID: <20200120161611.217bbbd2@endymion>
In-Reply-To: <20200105225012.11701-18-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-18-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Same as previous patch, subject line is wrong.

On Sun,  5 Jan 2020 23:50:04 +0100, Luca Ceresoli wrote:
> Remove misplaced dot before colon.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/smbus-protocol.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
> index de7285de5e93..7350e4b2c2fa 100644
> --- a/Documentation/i2c/smbus-protocol.rst
> +++ b/Documentation/i2c/smbus-protocol.rst
> @@ -146,7 +146,7 @@ Implemented by i2c_smbus_write_word_data()
>  
>  This is the opposite of the Read Word operation. 16 bits
>  of data are written to a device, to the designated register that is
> -specified through the Comm byte.::
> +specified through the Comm byte::
>  
>    S Addr Wr [A] Comm [A] DataLow [A] DataHigh [A] P
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
