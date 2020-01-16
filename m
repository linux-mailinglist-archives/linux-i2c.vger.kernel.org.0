Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0AD13D71B
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2020 10:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730724AbgAPJkd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jan 2020 04:40:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:35358 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726370AbgAPJkd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Jan 2020 04:40:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 40574B1AD;
        Thu, 16 Jan 2020 09:40:31 +0000 (UTC)
Date:   Thu, 16 Jan 2020 10:40:30 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/26] docs: i2c: fix typo
Message-ID: <20200116104030.2df59d94@endymion>
In-Reply-To: <20200105225012.11701-5-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-5-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun,  5 Jan 2020 23:49:51 +0100, Luca Ceresoli wrote:
> Fix "issus" -> "issues".
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Peter Rosin <peda@axentia.se>
> ---
>  Documentation/i2c/i2c-topology.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
> index 0875090d6aeb..b413ef6a6773 100644
> --- a/Documentation/i2c/i2c-topology.rst
> +++ b/Documentation/i2c/i2c-topology.rst
> @@ -169,7 +169,7 @@ PL1. If you build a topology with a parent-locked mux being the child
>       of another mux, this might break a possible assumption from the
>       child mux that the root adapter is unused between its select op
>       and the actual transfer (e.g. if the child mux is auto-closing
> -     and the parent mux issus I2C-transfers as part of its select).
> +     and the parent mux issues I2C-transfers as part of its select).
>       This is especially the case if the parent mux is mux-locked, but
>       it may also happen if the parent mux is parent-locked.
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
