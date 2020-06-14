Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10C31F8A51
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 21:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgFNTE4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 15:04:56 -0400
Received: from ciffreo.uberspace.de ([185.26.156.173]:56632 "EHLO
        ciffreo.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgFNTE4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 15:04:56 -0400
X-Greylist: delayed 442 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Jun 2020 15:04:56 EDT
Received: (qmail 3238 invoked from network); 14 Jun 2020 18:57:33 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
  by ciffreo.uberspace.de with SMTP; 14 Jun 2020 18:57:33 -0000
Subject: Re: [PATCH 1/1] Documentation/i2c: SMBus start signal is S not A
To:     linux-i2c@vger.kernel.org
Cc:     git@danielschaefer.me, Wolfram Sang <wsa@kernel.org>
References: <20200614182355.19742-1-git@danielschaefer.me>
From:   =?UTF-8?Q?Daniel_Sch=c3=a4fer?= <daniel@danielschaefer.me>
Message-ID: <8972d446-2c69-787d-f98d-2d565a44c014@danielschaefer.me>
Date:   Sun, 14 Jun 2020 20:57:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200614182355.19742-1-git@danielschaefer.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/14/20 8:23 PM, git@danielschaefer.me wrote:
> From: Daniel Schaefer <git@danielschaefer.me>
> 
> Just like all other I2C/SMBus commands, the start signal for the SMBus
> Quick Command is S, not P.

Oops, should be 'not A' here, like in the commit title. Will you fix
that up while applying please, or should I send a new patch?

> 
> Cc: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Daniel Schaefer <git@danielschaefer.me>
> ---
>  Documentation/i2c/smbus-protocol.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
> index c2e29633071e..64689d19dd51 100644
> --- a/Documentation/i2c/smbus-protocol.rst
> +++ b/Documentation/i2c/smbus-protocol.rst
> @@ -57,7 +57,7 @@ SMBus Quick Command
>  
>  This sends a single bit to the device, at the place of the Rd/Wr bit::
>  
> -  A Addr Rd/Wr [A] P
> +  S Addr Rd/Wr [A] P
>  
>  Functionality flag: I2C_FUNC_SMBUS_QUICK
>  
> 
