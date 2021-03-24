Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE226348422
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 22:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbhCXVu0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 17:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhCXVt4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 17:49:56 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47630C06174A;
        Wed, 24 Mar 2021 14:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=EX6pAaAKbWbCSvkRWiAK+AYx238ttbosxSDxv0Nxz4U=; b=hGHrdg1tj24JzkN1Jc3s0tKyup
        ZpPJiZBoeGVJqd5yuSaTmzfnFdn4IuUEZF6RLizT1OlCqVAJGo+c2sOIB7lY3fP6ncA71M58ecW+B
        /3Cwg+XKraxx++mJJBF+tDAu8ujmg6owsHPEJHKahT6ewC0r1a4z1zGjgCPo7qWGVC/GQmasPORgd
        8o9b3WKXO9ZCI3uYBaAwTDFeLlA5Xqu+1Hpd1gh28JrT0djvC80eduzlhCxbIWSy31205E0NKnv27
        4qr2Fy/n4BsiZlUJfXlCYarLW5qcWVuL2y4iHSNzrPm0wPVgcijlF6+rflzspM4hvEE9QouOzEYM8
        znW76OyQ==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lPBNw-000Fuc-4M; Wed, 24 Mar 2021 21:49:52 +0000
Subject: Re: [PATCH] i2c-stm32f4: Mundane typo fix
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, p.zabel@pengutronix.de,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210324140610.32385-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d60fd628-d57a-306a-893f-840b16c5f307@infradead.org>
Date:   Wed, 24 Mar 2021 14:49:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324140610.32385-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/24/21 7:06 AM, Bhaskar Chowdhury wrote:
> 
> s/postion/position/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/i2c/busses/i2c-stm32f4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index 937c2c8fd349..4933fc8ce3fd 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -534,7 +534,7 @@ static void stm32f4_i2c_handle_rx_addr(struct stm32f4_i2c_dev *i2c_dev)
>  	default:
>  		/*
>  		 * N-byte reception:
> -		 * Enable ACK, reset POS (ACK postion) and clear ADDR flag.
> +		 * Enable ACK, reset POS (ACK position) and clear ADDR flag.
>  		 * In that way, ACK will be sent as soon as the current byte
>  		 * will be received in the shift register
>  		 */
> --


-- 
~Randy

