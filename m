Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43CE913D73A
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2020 10:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729977AbgAPJtL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 16 Jan 2020 04:49:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:42442 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729546AbgAPJtL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Jan 2020 04:49:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 29BD1AED8;
        Thu, 16 Jan 2020 09:49:09 +0000 (UTC)
Date:   Thu, 16 Jan 2020 10:49:07 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 26/26] docs: i2c: rename sections so the overall picture
 is clearer
Message-ID: <20200116104907.3f2de4d0@endymion>
In-Reply-To: <20200106074905.14438-1-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200106074905.14438-1-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon,  6 Jan 2020 08:49:05 +0100, Luca Ceresoli wrote:
> Some of the section names are not very clear. Reading those names in the
> index.rst page does not help much in grasping what the content is supposed
> to be.
> 
> Rename those sections to clarify their content, especially when reading
> the index page.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Peter Rosin <peda@axentia.se>
> ---
> 
> Note: here checkpatch complains:
> 
>   WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> 
> Thas's because those files have no license line. I would gladly add a
> proper license line, but what it the correct license here? Should I ask the
> authors? GPLv2-only as the kernel default?
> 
> I'd appreciate a guidance here, thanks in advance.

I don't think we need a license for such documentation files, so I
would just ignore checkpatch.

> ---
>  Documentation/i2c/dev-interface.rst         | 6 +++---
>  Documentation/i2c/i2c-protocol.rst          | 6 +++---
>  Documentation/i2c/i2c-topology.rst          | 6 +++---
>  Documentation/i2c/old-module-parameters.rst | 6 +++---
>  Documentation/i2c/smbus-protocol.rst        | 6 +++---
>  Documentation/i2c/summary.rst               | 6 +++---
>  Documentation/i2c/writing-clients.rst       | 6 +++---
>  7 files changed, 21 insertions(+), 21 deletions(-)
> (...)
> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
> index fc69d9567d9d..ae3bbb9fd8f1 100644
> --- a/Documentation/i2c/summary.rst
> +++ b/Documentation/i2c/summary.rst
> @@ -1,6 +1,6 @@
> -=============
> -I2C and SMBus
> -=============
> +==============================
> +Introductions to I2C and SMBus
> +==============================

I would use "Introduction", singular.

>  
>  I²C (pronounce: I squared C and written I2C in the kernel documentation) is
>  a protocol developed by Philips. It is a slow two-wire protocol (variable
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
