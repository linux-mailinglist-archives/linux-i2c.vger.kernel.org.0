Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5599D6BADA6
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Mar 2023 11:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbjCOK3N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Mar 2023 06:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjCOK3M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Mar 2023 06:29:12 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1D066D2A
        for <linux-i2c@vger.kernel.org>; Wed, 15 Mar 2023 03:29:11 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id c11so13800021oiw.2
        for <linux-i2c@vger.kernel.org>; Wed, 15 Mar 2023 03:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1678876150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NHlZDiVHnerqeSSFzhJX7le/t5No4osa6kOg/Kk42cI=;
        b=LTPBN9pKjTVsmsyb3hK8xQncvg994vD90K4SC+CpzUqZI+J+mOwAMylPVAEOYh7FGe
         H68Mx8xEVJCNHeLjuApVEcGIGPKmVl2nrBpI+yoQhKeh3loTujISbcQaN4By0ffswgpb
         upV3wzUU/uPO9YJcJZ6QXxcD8qDngclM5JVTV7sRYBmIM3JRnGb/Q49RSlG/+LSFmTfk
         ZIqUe10QQ3N0gcpQpOg+cTztHE+8duaj/MlC/miT7nuaboAs9ofssmZ3EwOBKX/4Uxnj
         cVwZuJAo5mGoX/Iu23Qf2XuLob03kBbtrTUG/VdHGyPxy7/SU8n6RmlP+/jc8OIEohlW
         qAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678876150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHlZDiVHnerqeSSFzhJX7le/t5No4osa6kOg/Kk42cI=;
        b=3ytxYLEhzhlQZuUS6Cnn1y0lzBMiHYu9p0YSNjQst96suHiZIFmzUApI3armGQn+ZW
         5eA/vlBnyXWf2esLL3BeFa6Ibuj7gk8h1mShRU7Pv+0p+85ESzq7wcyq+vZ8FQc7VFYO
         W1/XigerpNVvvuZHj9eRqas2xcChDcTccagAKBQRxXyyxR+OT1orOc7ALIaQXtXvRJwL
         ASbsMXI9FZYOs/eyEi8WaT248WIr2HA8G3mPwFMylIT5Crt0QIEZ0hl0+j3jwFERzTf7
         IzGMG3sCwpi68LPrydS+MjzVQFTX/rFt1n1QC3R2jHOAZhrO6L4cr5fGsyAH+b2zI31J
         NnJw==
X-Gm-Message-State: AO0yUKUKlcKWzRmgZ/hx/kxQ80bvz0bxzPJEnZPMGuJvHn5SAeQiV0RX
        t928C1OhfBjAGELKVFRdGGxKQPL/DYB/kSQqy6kfQw==
X-Google-Smtp-Source: AK7set8StxKjIBBR19FNKDATBWPEQwTX1DIZwddywltpJhamhxGsFpO4Q+629gdUe2zbO3zF56HjWtLW1DzExpOKmhM=
X-Received: by 2002:a05:6808:8c5:b0:37f:a9b3:9ce6 with SMTP id
 k5-20020a05680808c500b0037fa9b39ce6mr650355oij.4.1678876150689; Wed, 15 Mar
 2023 03:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230310211954.2490-1-mario.limonciello@amd.com> <20230310211954.2490-7-mario.limonciello@amd.com>
In-Reply-To: <20230310211954.2490-7-mario.limonciello@amd.com>
From:   Grzegorz Bernacki <gjb@semihalf.com>
Date:   Wed, 15 Mar 2023 11:28:59 +0100
Message-ID: <CAA2Cew4zoi3F0r+Jtnq=nXRCamOOyZJtR3hbxTinqX1HLbRb5g@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] i2c: designware: Use PCI PSP driver for communication
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Rijo-john.Thomas@amd.com, Thomas.Lendacky@amd.com,
        herbert@gondor.apana.org.au,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Felix.Held@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mario,

[..]
>  int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
>  {
> -       int ret;
> +       if (!IS_REACHABLE(CRYPTO_DEV_CCP_DD))
> +               return -ENODEV;
>
I think it should be "IS_REACHABLE(CONFIG_CRYPTO_DEV_CCP_DD)"
thanks,
grzegorz
