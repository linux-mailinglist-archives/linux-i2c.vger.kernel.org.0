Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23C7E19E6A4
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Apr 2020 19:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgDDRSZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Apr 2020 13:18:25 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:46360 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgDDRSY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Apr 2020 13:18:24 -0400
Received: by mail-il1-f196.google.com with SMTP id i75so10521350ild.13;
        Sat, 04 Apr 2020 10:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6/+9ql20CpFx44LIbrTXEaI2rIrP2FNLIFPT9pvv1Qs=;
        b=MYIYJVxMWv/NMrikK5DZ6Br2UTzYCDXlYlp+yYH9MnI/7It1gV2Z1vbxyrHDkcB74E
         9XrZJ4mVI7KHF6rZ6Uw7nO21YckyU5K5IcdgNZRvYCSyIRtqIzdI//P1GFrlnH7qYZz+
         EeYqKDSrJ8MAIML3X5F1NZN/GwzGOpoeAjM2OR302hiLMu4n/pVHy1W9b8kRKh2BZYj0
         dtLG3B8q6iv4F694dalRMD0nQtEhO6SiUSt4r8gcEChU2fr3OHSgvqOrycHl4Vu8rJpC
         JvmY7YDJhud9KqB0whe31gqoCNuT3I6Am77Rp99Dsqaa8IfvV/htBaWVX7NMmH5/zTED
         Wnhw==
X-Gm-Message-State: AGi0PubGA2CD6xLUdH5I/7qLvbIDHCLcQ7w7RYOl8SZVSYY+n+VXkVRw
        d6lkwpbvw3nYfPvae93nww==
X-Google-Smtp-Source: APiQypIzCX8GwLPGwwKuqPKkuY3KZcZx+/fEOhsdfxnj62kPmcdX91ySH0xxjFk/0PA6YlV8wtmF0A==
X-Received: by 2002:a92:d347:: with SMTP id a7mr14714839ilh.289.1586020703682;
        Sat, 04 Apr 2020 10:18:23 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h24sm3416997iog.29.2020.04.04.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:18:23 -0700 (PDT)
Received: (nullmailer pid 24101 invoked by uid 1000);
        Sat, 04 Apr 2020 17:18:20 -0000
Date:   Sat, 4 Apr 2020 11:18:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com, alain.volmat@st.com
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: i2c-stm32f7: allow
 clock-frequency range
Message-ID: <20200404171820.GA24040@bogus>
References: <1585226661-26262-1-git-send-email-alain.volmat@st.com>
 <1585226661-26262-2-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585226661-26262-2-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 26 Mar 2020 13:44:20 +0100, Alain Volmat wrote:
> For STM32F7, STM32H7 and STM32MP1 SoCs, if timing parameters
> match, the bus clock frequency can be from 1Hz to 1MHz.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
> v2: identical to v1
> 
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
