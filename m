Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FAE375E19
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 02:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232987AbhEGA4S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 20:56:18 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:39728 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhEGA4S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 May 2021 20:56:18 -0400
Received: by mail-ot1-f52.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso6581466otv.6;
        Thu, 06 May 2021 17:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LOi26ePLcMhTv9NBLT2b9h8iasffGUoNExW6gEB59Hg=;
        b=nkZPUIgYWEnvyDe8ZKAwFGnqhTuwIZBstfOuvoMmLC/7BMdYFENqOh18wPjuUZ+R5+
         FRuGUAegWiA175Z00mYQvHg2OgaQ/toD/KJbkx04aLxFd4sf5sL0nXqptzTQuWbYzgKe
         HUOaMyoqnJ9oI0LbKNNyHRscimMOkZSpNO9/yqY70cOJXXEahcUk53WmlWievkM8ZvlD
         JoiO27X6tNluin+rT1GgsDHvx/OxCgJuxfuARu58ne2ooF1oD+atcdpMJQZQhfWxRYm7
         ERCS3JxeMFZqckcsuz/k1JMyN4X0+WK5VdHskbL6u3cjfcgYphIXO/ogwHTsuZ7hzk0X
         SXqg==
X-Gm-Message-State: AOAM533ibCcWjZPVPNxUBB+UJ012+wviYX/AJLTIKW8OUt9eiBad9u21
        2OiEvuadVeR67YOQC1e++o7E4EXUwQ==
X-Google-Smtp-Source: ABdhPJxeyomDM66blWkjlzllouut9B4dA4muWExmIjhFAk5mmRPq+Z8eGugC9Zp/pbuJPuBLvSakTA==
X-Received: by 2002:a9d:6244:: with SMTP id i4mr5796115otk.182.1620348919518;
        Thu, 06 May 2021 17:55:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g9sm805749oop.30.2021.05.06.17.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 17:55:18 -0700 (PDT)
Received: (nullmailer pid 1101099 invoked by uid 1000);
        Fri, 07 May 2021 00:55:17 -0000
Date:   Thu, 6 May 2021 19:55:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     wsa@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v4 1/2] i2c: add binding to mark a bus as supporting
 SMBus-Alert
Message-ID: <20210507005517.GA1098665@robh.at.kernel.org>
References: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
 <1620220479-2647-2-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620220479-2647-2-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 05, 2021 at 03:14:38PM +0200, Alain Volmat wrote:
> Since SMBus-Alert is an optional feature of SMBUS which
> requires an additional pin, the smbus binding cannot be
> used to indicate its support.
> 
> Add an additional smbus-alert binding specific for it and
> update the description text of smbus to avoid mentioning
> SMBus-Alert
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

This needs to be added to i2c-bus.yaml too.

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index df41f72afc87..b864916e087f 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -89,8 +89,11 @@ wants to support one of the below features, it should adapt these bindings.
>  
>  - smbus
>  	states that additional SMBus restrictions and features apply to this bus.
> -	Examples of features are SMBusHostNotify and SMBusAlert. Examples of
> -	restrictions are more reserved addresses and timeout definitions.
> +	An example of feature is SMBusHostNotify. Examples of restrictions are
> +	more reserved addresses and timeout definitions.
> +
> +- smbus-alert
> +	states that the optional SMBus-Alert feature apply to this bus.
>  
>  Required properties (per child device)
>  --------------------------------------
> -- 
> 2.7.4
> 
