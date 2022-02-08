Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3605B4AD4AD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 10:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350429AbiBHJWo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 04:22:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347495AbiBHJWn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 04:22:43 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0F8C0401F0;
        Tue,  8 Feb 2022 01:22:42 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id fh9so5700406qvb.1;
        Tue, 08 Feb 2022 01:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CYVaXukRgUCEvFAm5Rvccoy4E4azJEZwAWMrVoUo60s=;
        b=k7DIfwDI7lJiplAzuKEv1ztD9Ak9R+8xzxXZwM2usNppLiqm5bdYqIWjxkDIV/hyth
         ohH/mlhrT+QZKqQQcL4CVOEUStEq97nRWHFMcuBpSGh8p21ytE+IJyOPEqHc9spG2xBW
         C2ygszJiPgi6KJkccRu5ROmtgEnrKUhGWEmUSxXbx+XquhltiVUwk007dTvR1zFvr1mg
         4IKqahTBJrweYv7eF2lTvrY2L9Wf+Xlu2XxweOif/adWLK3ZobULps3DQMQXxzH5uHmr
         oeFKqTDxURrYQKIfoBjWfKCCmG6qhyEcL94CbAWjJjN24gAitBWghlsnh+R6+geClxmu
         t3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CYVaXukRgUCEvFAm5Rvccoy4E4azJEZwAWMrVoUo60s=;
        b=gDZkykNl6bFFXUwCsyJvQqDd9MDQXHUx8apA5RK+Xu0rjarQ5WQAqYVZKcC5LSbmeb
         Me307N6fZw/28hp4SlxFsRCKuUy8VmNe/J1Q4O5D80nfhQBhSXagkq0itZIzzfRSagSi
         PExFLAbXMBnFO9m4QdeIw1PseV/lxF7Tu1sL+o/P47fTQO/PSFXXFBiqr0beRdfYjTUj
         vuJFUwIZbuaXAoP34DnTF+f9ZRqybmMzGplevgnNhCZxS0oDSZSrNdxthN2ZQC0eOjqu
         /1I2l3M1QqSM7L6OfnvoVey3Fxw7VCqUAm2g6z3VEIU99GMuricWXMLbDv0ETGgrTijV
         52gA==
X-Gm-Message-State: AOAM533/M/ILzyAxyGhkXxuQwzECIBS3GZpEOiV5t5Xc8zIQb7zLmZiO
        SbmzMSkGZBSSUl+sdClrkDYyuuXn2ISG7MHV5CI=
X-Google-Smtp-Source: ABdhPJyIzKvFKpf1BBmc+9sLhRsGbOh9ftgw+xxzEK5Z04ibvmuVWz+wsnEwZUKatWlmrd9PAjYjXFPw3XpMNV/ekhc=
X-Received: by 2002:a05:6214:1cc7:: with SMTP id g7mr2490810qvd.124.1644312162002;
 Tue, 08 Feb 2022 01:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com> <20220207063338.6570-7-warp5tw@gmail.com>
In-Reply-To: <20220207063338.6570-7-warp5tw@gmail.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Tue, 8 Feb 2022 11:22:30 +0200
Message-ID: <CAHb3i=vdc_+J4pCBcY--C85ZR1uXO1LG02UsttsfSnsQBDKWAg@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        Wolfram Sang <wsa@kernel.org>, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>On 08/02/2022 09:51, Tali Perry wrote:
>>> On 08/02/2022 08:14, Tali Perry wrote:
>>>>> Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>>>>>
>>>>> On 07/02/2022 13:00, Jonathan Neusch=C3=A4fer wrote:
>>>>>> Hello,
>>>>>>
>>>>>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>>>>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>>>>>
>>>>>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>>>>>> The only difference is that the internal HW FIFO is larger.
>>>>>>>
>>>>>>> Related Makefile and Kconfig files are modified to support as well.
>>>>>>>
>>>>>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>>>>>> driver")
>>>>>>
>>>>>> It's not really a bug fix, but rather an additional feature.
>>>>>> Therefore, I suggest removing the Fixes tag from this patch.
>>>>>>
>>>>>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>>>>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>>>>> ---
>>>>>> [...]
>>>>>>>  /* init register and default value required to enable module */
>>>>>>>  #define NPCM_I2CSEGCTL 0xE4
>>>>>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>>>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>>>>>> +#else
>>>>>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>>>>>> +#endif
>>>>>>
>>>>>> This is going to cause problems when someone tries to compile a kern=
el
>>>>>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>>>>>> only work on NPCM7xx).
>>>>>
>>>>> Yes, good catch.
>>>>>
>>>>> The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so thi=
s looks like an invalid code. How such code is supposed to work on multipla=
tform kernel?
>>>>>
>>>>
>>>> NPCM7xx and NPCM8xx are very different devices.
>>>> They share same driver sources for some of the modules but it's not AB=
I.
>>>> Users cannot compile a single kernel with two separate DTS.
>>>> In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
>>>> and the NPCM8xx has 32 bytes HW FIFO.
>>>> This also means that registers fields are slightly different.
>>>> For init data we can move it to the DTS, but register field sizes
>>>> can't be handled with this approach.
>>>>
>>>
>>> What do you mean they cannot compile a kernel with different DTS? Of
>>> course they can - when we talk about multiplatform sub-architectures!
>>> Maybe there is something specific in NPCMxxx which stops it but then it
>>> should not be marked multiplatform.
>>>
>>
>>
>> NCPM7xx is ARM32 bit (dual core Cortex A9)
>> NPCM8xx is ARM64 bit (quad core Cortex A35)
>>
>> They have completely different architecture so not ABI compliant.
>> I2C module is similar, but the devices are quite different and have
>> separate architectures.
>
>OK, in such case usually you indeed can't have both. :)
>
>> Sorry for the confusion.
>> This is the first patch we try to upstream for NPCM8xx.
>> In the coming weeks we will upstream the architecture of NPCM8xx as well=
.
>
>Still, ARCH_XXX should not be hard-coded in the drivers to change the
>driver's behavior, even if driver won't be used simultaneously. It
>breaks all design principles and prevents any further re-use if a new
>use case appears.
>
>You can use "ifdef ARCH_XXX" to skip building of some parts of the
>driver, but it's not the case here.
>

Correct, the main change is in FIFO size:
+#ifdef CONFIG_ARCH_NPCM7XX
#define I2C_HW_FIFO_SIZE               16
+#else
+#define I2C_HW_FIFO_SIZE               32
+#endif /* CONFIG_ARCH_NPCM7XX */

NPCM7XX will always have 16 bytes, all the next gens will have 32.

This impact some registers sizes, like this one:

+#ifdef CONFIG_ARCH_NPCM7XX
#define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(4, 0)
+#else
+#define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(5, 0)
+#endif /*CONFIG_ARCH_NPCM7XX*/

For this, the FIFO size should be defined before compilation.
I also don't want to let users select FIFO size per architecture.
NPCM7XX has 16, NPCM8XX has 32. This is not a user selection.
It's part of the arch.



>
>Best regards,
>Krzysztof

Thanks,
Tali
