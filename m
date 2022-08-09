Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A7B58D1D4
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Aug 2022 03:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbiHIBzd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 21:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiHIBzc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 21:55:32 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC3ED765D;
        Mon,  8 Aug 2022 18:55:29 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id t22-20020a17090a449600b001f617f2bf3eso509420pjg.0;
        Mon, 08 Aug 2022 18:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=XZt5zgEjQCwFFuOlDwZAbpzV5OLOdCK3uQF6Y61LXQU=;
        b=mORk0+lScHx5LoFJxnabREFeM1OncRpeoqzqpHpmCi2jMtnp5Fpv9duwsbfOUOsLc4
         WFtCKbAaiO714ZTxKcHrptTYBJUiPST5+/A9CIBKzleMhlWt15tCct852B08ImG8BnMB
         FECgxK3IVguJ8Ngx4aJRcreasWDwUF7Gl82EfLnLeSJ3Qn/q3yUpM/1l9FdODARQBLJd
         gwh8+MXaDuZHti9TweZesSifLvyNgnYWEniW1DUEnggrl29sPXHp6lwulD9Mfqx2LKOW
         qNgGzExeiA1P0aHyTqm3E6G3GVRJ7vg8ZCh/HnwvexvSICRDxquX7oO4HyGeT5131ZVg
         9BbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XZt5zgEjQCwFFuOlDwZAbpzV5OLOdCK3uQF6Y61LXQU=;
        b=e7VHhWxoXVlO9fgbgMuMAgm9/t6SF/6aiKCUBDZG0cOoq1/jWpxLi5sW66sa+3UWlB
         ioFCKmVkdvgYu4O8dB//gwYyU/fS93N3mIOgglq9DWq9BJPfYpEG8jTFC9UTpK9Z3wTQ
         T0d4/LRpbJ7OHaybXeC++nDGB4ELh0ON4hhTB+mVM6FCtmwE9TlH8OlC05ceeN6+xpOY
         6FgtkHdt60lnhKYmfOBZv29fpKv/LMpkQS2vQJkZkKC5XQnUT7uYcm9FqfS64uQw+vMW
         DiVsEWMepbK4YZ13OGnFd5SEQXlghGZOvspFrmEEvw9AubYxY8/Z4wTtAcyTdfFTj3aU
         XU1g==
X-Gm-Message-State: ACgBeo19alDUgeod8X16t7+/cRJlfqZGwn5TjGNqLIU82mAnhadvhOkf
        BwUsQTIlppGCs/cLhcFt7ws=
X-Google-Smtp-Source: AA6agR4R8AIa8xyGVkW3RczizbTCuHAgfcbqCZW2jGUXtY09/uGntFbunovSoLWd4NQ2QYW/7K+afw==
X-Received: by 2002:a17:90b:1bc7:b0:1f5:37a6:e473 with SMTP id oa7-20020a17090b1bc700b001f537a6e473mr23144551pjb.87.1660010129214;
        Mon, 08 Aug 2022 18:55:29 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-20.three.co.id. [180.214.233.20])
        by smtp.gmail.com with ESMTPSA id b13-20020a170903228d00b00162529828aesm9489770plh.109.2022.08.08.18.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 18:55:28 -0700 (PDT)
Message-ID: <b5aa9682-48c3-ac1b-7d8f-f16d268f235d@gmail.com>
Date:   Tue, 9 Aug 2022 08:55:22 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/9] docs: i2c: smbus-protocol: improve DataLow/DataHigh
 definition
Content-Language: en-US
To:     luca.ceresoli@bootlin.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
 <20220808141708.1021103-5-luca.ceresoli@bootlin.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20220808141708.1021103-5-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/8/22 21:17, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Use a more professional wording.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  Documentation/i2c/smbus-protocol.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
> index 55e209c7e520..4942c4cad4ad 100644
> --- a/Documentation/i2c/smbus-protocol.rst
> +++ b/Documentation/i2c/smbus-protocol.rst
> @@ -45,8 +45,8 @@ Addr  (7 bits)  I2C 7 bit address. Note that this can be expanded to
>                  get a 10 bit I2C address.
>  Comm  (8 bits)  Command byte, a data byte which often selects a register on
>                  the device.
> -Data  (8 bits)  A plain data byte. Sometimes, I write DataLow, DataHigh
> -                for 16 bit data.
> +Data  (8 bits)  A plain data byte. DataLow and DataHigh represent the low and
> +                high byte of a 16 bit word.
>  Count (8 bits)  A data byte containing the length of a block operation.
>  
>  [..]            Data sent by I2C device, as opposed to data sent by the host

Looks better, thanks.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara
