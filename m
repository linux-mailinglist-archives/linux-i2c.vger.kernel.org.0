Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80D6C64E2C8
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Dec 2022 22:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiLOVJ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Dec 2022 16:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiLOVJ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Dec 2022 16:09:57 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676A6554C0;
        Thu, 15 Dec 2022 13:09:56 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id b2so1583923eja.7;
        Thu, 15 Dec 2022 13:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMnhGVedVQaeC/+zGA9FNx2gKnCSHop889BA9Qvtlhk=;
        b=ZHdTA6jak7dbnSzv/duUjJ2ewjRQwAxNf0jowtGb9Vhq9hsmSo+G+MDY13sJy3ewwu
         z0tXOg2fpYJwvi/f6ovGFgynMM8Vf6iaidPxI/g7cJXmFnG6mgZHj2iSaWQf55DqFUFs
         /bRxq/T+Ow2vWiIGlMBAO90sVFjw3TiLQY9LwYzB2Rh1dFcC657c6PjEmaMpdMzpmjWU
         Fr4HlKjsI3kVLENonrVm0AxrLSnW9ybXvWaHILgkAP2YoTDVRn2HRHw/ajXpZikBSjRX
         y2n1JpAXZb+tDMJpXSPZMNZFjmDXVDiDPRxfVlE+DldII+GnISBI1a7sDtN+OmFvsjSH
         u7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMnhGVedVQaeC/+zGA9FNx2gKnCSHop889BA9Qvtlhk=;
        b=ll5skriRkfGL/i8ZuBCmHSU3nLlFTWRbExbolsIJYC8LQLrygO9Urj0f05zvPY4YNT
         0U5TUMt6pwZ6mehlkEXq3DHLxbix9vcEqOlvC5ETJVoyJKNo6f3+T/S0uYkXkSOJMJCV
         n+S7fUcSztF8yH/VL15FU0YtR8CMWcCR1c+xJnN+HjN5Pwzn4Hk1+Cx6V3h14WnM2xCD
         hOyow8mjdLx1NmoN9m+CG+UiG4uepYYm0mUye2KlzIJuhxM2Q8HQMh19AUt/5KnpN05k
         CG0g+J1BZeHtYXbISHDCQPRR9fYdTc8IseeqScdW4DmHUVxoQLpGvgH3BxSSFOHAsji2
         QoDQ==
X-Gm-Message-State: ANoB5pmkUkfASLBWwqRXwLX1JycpvA5K+uxNw5qhy0dZMClZiXZdrO7M
        mNEP1BFbT1HmH28CIwwj8lA=
X-Google-Smtp-Source: AA0mqf730dhZxElgrHmPWWAW2fDFzQoq3Qj67dGGWYXHVW1B3nQyNqKv4Gw2sv5fKqqtPPD9R2f7wA==
X-Received: by 2002:a17:906:c088:b0:7c4:a773:4d72 with SMTP id f8-20020a170906c08800b007c4a7734d72mr9704836ejz.64.1671138594797;
        Thu, 15 Dec 2022 13:09:54 -0800 (PST)
Received: from ?IPV6:2a01:c23:b994:d200:f5f7:4fbb:396a:5352? (dynamic-2a01-0c23-b994-d200-f5f7-4fbb-396a-5352.c23.pool.telefonica.de. [2a01:c23:b994:d200:f5f7:4fbb:396a:5352])
        by smtp.googlemail.com with ESMTPSA id ss1-20020a170907c00100b007c0d41736c0sm86464ejc.39.2022.12.15.13.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 13:09:54 -0800 (PST)
Message-ID: <43cc28d2-2dce-730a-0d23-251b1c3b8713@gmail.com>
Date:   Thu, 15 Dec 2022 22:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] i2c: i801: Safely share SMBus with BIOS/ACPI
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>, Hector Martin <marcan@marcan.st>
Cc:     Alex Henrie <alexh@vpitech.com>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Ettore Chimenti <ek5.chimenti@gmail.com>
References: <20210626054113.246309-1-marcan@marcan.st>
 <20221215152641.39164ca3@endymion.delvare>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20221215152641.39164ca3@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15.12.2022 15:26, Jean Delvare wrote:
> Hi all, 
> 
> I know it's been a while, and I have to apologize for that. The
> original plan was to merge the patch series from Heiner Kallweit first,
> but as it turns out, it was never resubmitted after my (admittedly
> slow) review and things got stuck.
> 
Indeed, this has been stuck. I have to set finishing this series on
my task list again.

> Anyway, I finally took some time to review this patch. I have a good
> headache now, and some comments below.
> 
[...]
