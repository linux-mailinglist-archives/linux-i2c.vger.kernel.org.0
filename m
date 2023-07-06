Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8273874A5D6
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 23:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjGFVWI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 17:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjGFVWH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 17:22:07 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372811BF0;
        Thu,  6 Jul 2023 14:22:06 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3142ee41fd2so1170238f8f.3;
        Thu, 06 Jul 2023 14:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688678524; x=1691270524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0FvpS/+1YUK2280YM22guyluj/H/r120tkVYHERIJhg=;
        b=E2724ppdCPfiRw6I8upDJQov4YlJgquzq6akts6GGTIazp0OM1zdRgSKJJMniM2Rmn
         BmWCvjasy/B3bi6+ttfMgVIJALHUhshM69IYu3tMIpKc3JFauVa60jh2W8gtohxMvynM
         fPzbSO4HX1P5c4Zw8DqWa4w6EIOEHS6MM6rJ6akjBnupBsRu8ZnmP3ZzT2Rfh13NoS+g
         Fpt7wX8jcwN5fcj2rKpX6zACKeF4Xpy9cRjX5ZOwvZLVeDkDPxFm2kj9vgfFVy8whVku
         A0+2dKAsrbC/VXG1AkD7I5hduzzA6/1aIM7k48O3U85AIYXd0+1TLyHp4C2t62TckLPO
         enfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688678524; x=1691270524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FvpS/+1YUK2280YM22guyluj/H/r120tkVYHERIJhg=;
        b=bCeQYw+HoXato6oWrzN2iRyzAUBZTp0Ntl8qbAlJwzLwLjJE9KiOaw0FOCMR8sRiZf
         b5ap0tYWVsauY0/6evg5PQO1Z0p3Oky0POKovMa370s2djUHblbz636QmvPyiorQljLB
         hUiJmKN+Ar2wZv2Fyl5qyXPmHRaK2uAQURcFX1o70/fmFtnpGGWj4twMgHvTJQwcwvKZ
         3uUjA6GMXZ4rtZl8Iuukv+T4fVez5A6+SVRHATsqLPY2AgECjPWtSYMYYnGNNqgc8aGj
         N/5t48pDMeM9RMqUQi+0m1+Xl5hLJIMIsesv4U7tDRaulb0HyIM/ogAYEPdfMo2l+gU5
         qsuA==
X-Gm-Message-State: ABy/qLYgsT918mcD/jc+OaG4NpfndjJVgT4Wwv92AuIY4I9Ppw7f/J6x
        T6PIWvuxSPqPtsFTkfr+r8PacclYwsoyTTPHWlc=
X-Google-Smtp-Source: APBJJlHRel6vaU4WRUoQQhFpLXuRxT5GKkO7wlb0TzaYHYtxp+R1anuSt3SxIQrA+1XykMalY0T9JlPu3tdhBk1Em6I=
X-Received: by 2002:a5d:58cf:0:b0:314:77a:c2b2 with SMTP id
 o15-20020a5d58cf000000b00314077ac2b2mr2256584wrf.32.1688678524280; Thu, 06
 Jul 2023 14:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211414.10660-1-dg573847474@gmail.com>
In-Reply-To: <20230706211414.10660-1-dg573847474@gmail.com>
From:   Chengfeng Ye <dg573847474@gmail.com>
Date:   Fri, 7 Jul 2023 05:21:53 +0800
Message-ID: <CAAo+4rW1kmiVGbGxMUBsggQiY7dpOTUq+t6B=QTrikwBp72Kkw@mail.gmail.com>
Subject: Re: [PATCH RESEND] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
To:     andi.shyti@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
        wsa@kernel.org
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ray and Wolfram,

> I can't apply it, what version is this against?

The patch is based on 6.4-rc7. I resend the patch with this
email because I had some problems setting up the previous
one with git send-email. That patch was manually pasted
so that might be the reason for not being able to be applied.

Best Regards,
Chengfeng
