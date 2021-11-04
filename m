Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231E344562F
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Nov 2021 16:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhKDPXG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Nov 2021 11:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbhKDPXF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Nov 2021 11:23:05 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9360C061714;
        Thu,  4 Nov 2021 08:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=Ji+bbfdo4q3qSjBuRHvVJfeL6yI7SMwgkPDy5yTTkw0=; b=jS7vtzK0f33pcSpWtiKEEfPORA
        A6TIvQTX+8BBJEtti1SxJbDy/jLEXYOxxF6jF71NJkZ4Sy+7bJWXEZgZ3Nf7puhpUkVl7CFvbRb9Y
        zbcuKV6E0vY57dYAhbZMlH9lNGZefeltq40x99vw1wwB21gfsvW0FSRwqwDM0SdLROjC5WEGGNF7t
        PEoH8AWatIlM7xbdRVKPA/puXOHFkpk7bU5qDmcwyN2NuStt+7dEU9XwOj0S9T1ki/67sdld4ExkX
        cwrVWeenLGt+WiiJULrh+asLqARsTnMELtQ+HalEDSvuPyxtI4QGGM7T7T5TdZd+D8RKUamt1qrgx
        PPC55vjQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mieXT-009F1m-8f; Thu, 04 Nov 2021 15:20:27 +0000
Subject: Re: [PATCH] Docs: Fixes link to I2C specification
To:     Deep Majumder <deep@fastmail.in>, wsa@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211104060018.35570-1-deep@fastmail.in>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cfdeab60-a59e-591b-363b-c34ccf58d52a@infradead.org>
Date:   Thu, 4 Nov 2021 08:20:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104060018.35570-1-deep@fastmail.in>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/3/21 11:00 PM, Deep Majumder wrote:
> The link to the I2C specification is broken and is replaced in this
> patch by one that points to Rev 6 (2014) of the specification.
> Although `https://www.nxp.com" hosts the Rev 7 (2021) of this
> specification, it is behind a login-wall and thus cannot be used.

To be clear, it can be downloaded if one registers first, but it cannot
easily be downloaded by using something like 'wget filename'.

> 
> Signed-off-by: Deep Majumder <deep@fastmail.in>
> ---
>   Documentation/i2c/summary.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
> index 136c4e333be7..607c72425ca6 100644
> --- a/Documentation/i2c/summary.rst
> +++ b/Documentation/i2c/summary.rst
> @@ -12,7 +12,7 @@ and so are not advertised as being I2C but come under different names,
>   e.g. TWI (Two Wire Interface), IIC.
>   
>   The official I2C specification is the `"I2C-bus specification and user
> -manual" (UM10204) <https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_
> +manual" (UM10204) <https://www.pololu.com/file/0J435/UM10204.pdf>`_
>   published by NXP Semiconductors.
>   
>   SMBus (System Management Bus) is based on the I2C protocol, and is mostly
> 


-- 
~Randy
