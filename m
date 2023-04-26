Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A19F96EF91B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Apr 2023 19:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbjDZRQ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Apr 2023 13:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbjDZRQ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Apr 2023 13:16:27 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0843A8C;
        Wed, 26 Apr 2023 10:16:25 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-2fde2879eabso6797467f8f.1;
        Wed, 26 Apr 2023 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682529384; x=1685121384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oTMq1prpQ6rxKtc7jDCNoN5SDbD20gA0dCNcMQytMWA=;
        b=TLw6+by1HF4/WGDHrihz0BL5cfmwjEghaz8f+b7XnCDFdJFd6Ihm52bKAY5hDRIToe
         XEjA0AWx4iYlFSHEg9antcQM0E6mFVXMEkLYFtaIpgjdCjqRvE7EPHgodC8GYqawW0Oo
         Bx2KgKlkR9mM0X3ccacvPiz47vHFjUQK7qJ5VIJkOK1gbrXeYxm5FwhiEHOfx+4osaWL
         IcqBzI8DwbFVIIDs5jIL8hXVCEsnVrjB481aJCTU3MI+Ks7X73Iodq5U0WeYfeNyLtOH
         6v0KQ3Tx1XScWtKMNAn1LQ3QB3P1M9ejxw8Cyal3P2OFehq6P0WDBt61uw4v7SFtpAsz
         sCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682529384; x=1685121384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTMq1prpQ6rxKtc7jDCNoN5SDbD20gA0dCNcMQytMWA=;
        b=ICndiRjkpt6994PjsYnae7iplVd7J1GnRn5IHFjhvrWuf0fNjJz2MYw4GiffNbb/br
         JkB8+dGBk/oEg061UFeL8ga6Pm8sTa2Adf75k80kqoG0KmjUybmIqQ3pDZW8nHBfXvvj
         jtcYT00DqlUCjaFfJtcg0dwi2Jr1mebYMtF6cesfePazWFAZxsnCt/5mqFRbybFd2zeF
         7wDNxJbcjD37y2eYeM7K6vRPzmnsKeKXb9ur6uJ3ihQBmWWv12YIXyGrV3BuFCmZBeRY
         HJ686G8na+9db10mkW5hacM+rJL5cSOAqh63leitNZQcMM7KymePnwPkoZ55LzuiCQJU
         rIYA==
X-Gm-Message-State: AC+VfDzGc0+/fJwqZGS1tJlZ3SLSrwI6+hLll6WxvmygbUp2fD53jG3C
        ieVR2FSDwuz8pyjyjb+1hh4=
X-Google-Smtp-Source: ACHHUZ6m6GiTtcEpHjIQXjEpFcxqS1TOZLkiZFtCIoYMfa+pNSy/zOOSimtt/w45w8hANYSqx5M5RA==
X-Received: by 2002:a5d:528d:0:b0:304:aad4:b1e4 with SMTP id c13-20020a5d528d000000b00304aad4b1e4mr143167wrv.32.1682529384079;
        Wed, 26 Apr 2023 10:16:24 -0700 (PDT)
Received: from standask-GA-A55M-S2HP ([188.123.113.247])
        by smtp.gmail.com with ESMTPSA id c13-20020adfe70d000000b002fbaef32231sm16363698wrm.22.2023.04.26.10.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 10:16:23 -0700 (PDT)
Date:   Wed, 26 Apr 2023 19:16:21 +0200
From:   Stanislav Jakubek <stano.jakubek@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: brcm,kona-i2c: convert to YAML
Message-ID: <20230426171621.GA2506@standask-GA-A55M-S2HP>
References: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
 <72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com>
 <8d6042cd-f690-d274-c658-e83ff3a5776e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d6042cd-f690-d274-c658-e83ff3a5776e@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 24, 2023 at 03:53:07PM +0200, Krzysztof Kozlowski wrote:
> On 23/04/2023 14:40, Stanislav Jakubek wrote:
> > Convert Broadcom Kona family I2C bindings to DT schema.
> > 
> > Changes during conversion:
> >   - add used, but previously undocumented SoC-specific compatibles
> >   - drop references to SoCs that are not upstream
> >   - add supported clock frequencies according to the Linux driver [1]
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/i2c/busses/i2c-bcm-kona.c#n731
> 
> This line points to moving reference in next, so might no be accurate
> later. If you need external reference, then it should be some stable
> tag. But anyway if this is in mainline (is this?) then, why referencing
> via external link?

Yes, it's in mainline since 2013. I just pointed to linux-next since
that was what I had open at the time.

Just to make sure if I understood correctly, if it's in mainline then
there's no need to reference it via link? Or should I point to some tag
instead, e.g.:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-bcm-kona.c?h=v6.3#n731

Thank you for the review,
Stanislav

> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 
