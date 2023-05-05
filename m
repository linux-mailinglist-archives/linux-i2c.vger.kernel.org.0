Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 114BA6F7E12
	for <lists+linux-i2c@lfdr.de>; Fri,  5 May 2023 09:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbjEEHmz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 May 2023 03:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjEEHmy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 May 2023 03:42:54 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7C317FD5
        for <linux-i2c@vger.kernel.org>; Fri,  5 May 2023 00:42:50 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f4000ec71dso9671415e9.2
        for <linux-i2c@vger.kernel.org>; Fri, 05 May 2023 00:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683272569; x=1685864569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X0YN5W0LPlKPzpypfatqj33JsLIdDk9xz6FiE+5eHUE=;
        b=H3G3kDsoUB6tldvJFxZWuxGL17kvtDHQttrVE3BM4D4q93skWFZTPK3dkiaVrRowKf
         iIEfkiycBF0w4GgRrUPQSc143tHiA3sVwoawpqDldo7VeKOT9Btiqe12iy4zK9ymdPTK
         UI0bFfm1eizCepM10ycLWLWwOSdW8E0d1EqOcqiOTKZCxDmxFrdPDoVsVC90LsRe21nN
         4hdi4A5v8Mr2z0Z72VLbi7oTpGUzpPt7SBzdlzwUn0U2GSNmp1lbYJHDxOoC5Ei3Bacj
         xLs/02qJasuRu6UEq3T6cSYw8lu3QI765+OU4yCoCpVlPzT5p6vY27IcO8c/QeBMg8YY
         9PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683272569; x=1685864569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0YN5W0LPlKPzpypfatqj33JsLIdDk9xz6FiE+5eHUE=;
        b=kPCtSQLKM1GAWYQg/+/3l/iQw88KncKTCSv3i//JV1fYujegJ645INgx+DFGzU2ckB
         cV7hjL9puSbWl/X50KAkg9w1xEqVgmbuJfykYtUN6igYsHnG5V6hG8iGWI19kDzMCuyq
         iOXRV9yjF7aMuux/NKUpX5X1mpMu7r4yh1MDOHeCDCH6RkrcsRnKa3T0H1OGhE3fxJSZ
         Er6KaWT8yO+Nupt9ZIXFVbt2ukTus2mF6gzsZoo0+Ija09VWmGj7s/QYAPIfnWs6DIBh
         GB++I6VQUjv2ke/VsnsqwHigNx8Pht36Hb1WevsvM5dYFB5kL1JOTmQpt7YeADxJEg10
         oz3A==
X-Gm-Message-State: AC+VfDxgGUaRD7LvNkDKrOEcgf091fcg3TLU7Z5fCmGhk8Z7Eq/0pkkh
        YDJPcS9NMy3H7snzV9ljQIxfrg==
X-Google-Smtp-Source: ACHHUZ557C+5NiAT/VVERnB2kIdbITR+K945g324cnQaz2MPoOKZ70EhHM93mgYjMKq9+0QJjemUZA==
X-Received: by 2002:a05:600c:2298:b0:3f1:98df:bc03 with SMTP id 24-20020a05600c229800b003f198dfbc03mr381819wmf.25.1683272568932;
        Fri, 05 May 2023 00:42:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s6-20020adff806000000b003068f5cca8csm1459185wrp.94.2023.05.05.00.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:42:46 -0700 (PDT)
Date:   Fri, 5 May 2023 10:42:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     d202180596@hust.edu.cn
Cc:     andy gross <agross@kernel.org>,
        bjorn andersson <andersson@kernel.org>,
        konrad dybcio <konrad.dybcio@linaro.org>,
        wolfram sang <wsa@kernel.org>,
        "ivan t. ivanov" <iivanov@mm-sol.com>,
        sricharan r <sricharan@codeaurora.org>,
        naveen kaje <nkaje@codeaurora.org>,
        austin christ <austinwc@codeaurora.org>,
        hust-os-kernel-patches@googlegroups.com,
        andy gross <agross@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: Add missing unwind goto in qup_i2c_probe()
Message-ID: <e7f22f7c-8552-4766-a770-fa2d29e5068d@kili.mountain>
References: <20230418135612.598-1-d202180596@hust.edu.cn>
 <5c9f1e4d.47382.187e97d01a5.Coremail.d202180596@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c9f1e4d.47382.187e97d01a5.Coremail.d202180596@hust.edu.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 05, 2023 at 09:18:16AM +0800, d202180596@hust.edu.cn wrote:
> 
> > -----原始邮件-----
> > 发件人: "Shuai Jiang" <d202180596@hust.edu.cn>
> > 发送时间: 2023-04-18 21:56:12 (星期二)
              ^^^^^^^^^^

You can't ping the list when the merge window is open.  You have to wait
for a couple weeks after.

The weeks before and during the merge window are busy and then afterward
maintainers have to deal with the backlog of postponed stuff...

Just be patient.

regards,
dan carpenter
