Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57822148ACB
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2020 15:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388792AbgAXO5f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jan 2020 09:57:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:49048 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387544AbgAXO5e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jan 2020 09:57:34 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E5131AFBF;
        Fri, 24 Jan 2020 14:57:32 +0000 (UTC)
Date:   Fri, 24 Jan 2020 15:57:31 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/28] docs: i2c: smbus: fix link syntax
Message-ID: <20200124155731.5573076a@endymion>
In-Reply-To: <20200123135103.20540-12-luca@lucaceresoli.net>
References: <20200123135103.20540-1-luca@lucaceresoli.net>
        <20200123135103.20540-12-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 23 Jan 2020 14:50:46 +0100, Luca Ceresoli wrote:
> Use the proper ReST syntax to generate a valid hyperlink.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Subject line is incorrect, it should have "smbus-protocol:" instead of
"smbus:" for consistency with the other patches.

Other than that this is still

Reviewed-by: Jean Delvare <jdelvare@suse.de>

> ---
>  Documentation/i2c/smbus-protocol.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
> index e30eb1d274c6..1600b09ec0be 100644
> --- a/Documentation/i2c/smbus-protocol.rst
> +++ b/Documentation/i2c/smbus-protocol.rst
> @@ -27,8 +27,8 @@ a different protocol operation entirely.
>  Each transaction type corresponds to a functionality flag. Before calling a
>  transaction function, a device driver should always check (just once) for
>  the corresponding functionality flag to ensure that the underlying I2C
> -adapter supports the transaction in question. See
> -<file:Documentation/i2c/functionality.rst> for the details.
> +adapter supports the transaction in question. See :doc:`functionality` for
> +the details.
>  
>  
>  Key to symbols


-- 
Jean Delvare
SUSE L3 Support
