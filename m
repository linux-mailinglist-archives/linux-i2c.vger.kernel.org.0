Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC24A4B7301
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 17:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240984AbiBOQLn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 11:11:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238908AbiBOQKj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 11:10:39 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D5BCC53B
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 08:10:28 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id v13-20020a17090ac90d00b001b87bc106bdso3363989pjt.4
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 08:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DxPXqOfUMU15EyrVycNZtLqTDiurnQ0UjF132dPaRYQ=;
        b=hBrXJo01rIFJFUf9sVSaLANkFIh3IjC9nxkz0u9tePivt7++/MJpm/CZKvoGJwB4yI
         DTwRgG56zjsArojnGrpoYeoC/OmRdj7hvAvUMjCKydKb2gV9DoG8AXqLXMd0KA1owF3L
         F9x8g6z5wn2gRXWL62npsR8EtqL31QvndDABafuTvli40L/d6y/T4avWsiS7hXpV4SsS
         7jsJdW6N24mNlONKB7zN5dMgdllnnBp0EBbAUP1nNUUTPf9UBJ1QllmLtkH+0pr9TfGK
         ScvxZVjDt13skYd3gfqGd+xvUr8KBxqT3xi7CyOtGQL7HvrKQJZtWDqh8OYa8HplU+HN
         2zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DxPXqOfUMU15EyrVycNZtLqTDiurnQ0UjF132dPaRYQ=;
        b=qJeFo8bhrmdxzxG2eUGFIPoDN08G90NkneT14hF55eiY35pjuu41SCG19UVrhvqgRT
         K+xOcyqK9TRbWHQFR6t1sixo6ccWoXfLU5XFbnJbMDEArCQYxPPY3p+0AUomga/E6Ixr
         1yyk3Z7R3wxZlhz5GAFqIneK/7fW4cU8ty0B+AgiJdw2wR1QtoLLnI4VyYUPHnBZQRMB
         lzQOMHSaBX5psWEKvYk/tznc7J8SHpe7h89KuYwmmOPxSIiBe0H/4yhN+UMxsyPTe4fS
         j0iEhz9bMMT3d5olnHwXr0jfoTApvhfk4WFt0Ayp/2HXUpG2aoFsZKfSr4TXRc2Lka6P
         GgDA==
X-Gm-Message-State: AOAM533dvftqM4DcI6mCR0sSWvLnlY1WkrWNnTtJVxRbTVlJQ7hu7HEW
        UIzO8zMduqXqN8fJAWU9k3U=
X-Google-Smtp-Source: ABdhPJzqs202BLnwgibYg0v+23khU3mZahUWu07cF6krxuhhywrBB7iu4i53VuSJU0m+JcrDJCHB7Q==
X-Received: by 2002:a17:902:ef4c:: with SMTP id e12mr4706326plx.102.1644941428454;
        Tue, 15 Feb 2022 08:10:28 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:4a48:fd58:13e6:31bf:9336? ([2600:8802:b00:4a48:fd58:13e6:31bf:9336])
        by smtp.gmail.com with ESMTPSA id k14sm41403664pff.25.2022.02.15.08.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 08:10:27 -0800 (PST)
Message-ID: <ac9805f9-742d-868e-2140-e454c18b98cf@gmail.com>
Date:   Tue, 15 Feb 2022 08:10:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] i2c: brcmstb: fix support for DSL and CM variants
Content-Language: en-US
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220215072735.17335-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220215072735.17335-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2/14/2022 11:27 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> DSL and CM (Cable Modem) support 8 B max transfer size and have a custom
> DT binding for that reason. This driver was checking for a wrong
> "compatible" however which resulted in an incorrect setup.
> 
> Fixes: e2e5a2c61837 ("i2c: brcmstb: Adding support for CM and DSL SoCs")
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
