Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF4E281DDC
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Oct 2020 23:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgJBVvF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Oct 2020 17:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgJBVvB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Oct 2020 17:51:01 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69EEBC0613E3
        for <linux-i2c@vger.kernel.org>; Fri,  2 Oct 2020 14:51:01 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t7so1826600pjd.3
        for <linux-i2c@vger.kernel.org>; Fri, 02 Oct 2020 14:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=MTj4+BZWhmKGSnEdkwcHGMLlvYpIZh3xxkajlqsCipI=;
        b=aMLcL8EsV7LpoAegaaOlTz6Oxbj/G14dAbtudhcqsLMAn36QLmUNav89JexGzYGf0f
         mEGHI6AfH0PHDhYUAtpe15bZHYgDfBUiWt8CXACcdaAG0PX6nZ03oJcbo9gnGZEoswKX
         u5MFkTs5Ze65+D+PP0tIQvQH8t3F2q8cHna3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=MTj4+BZWhmKGSnEdkwcHGMLlvYpIZh3xxkajlqsCipI=;
        b=DmoGrW90FC3QzutdAxpcWiOO5PIROLt+wv6/RDjKvAOelhTfbWuSqP3Y+qsVv+mYIf
         MqzQhKKpUIgkmlwtMlQZVjaL1fFwserimRW8wtWG3LVAcsYT2jC7fXHRIvJ9h4lK2FF0
         QSgXgWLuJ9u0oAC6R8z0Gr6PuZIzMQA/W6PzoLBQUohSacKCDhteKoeNAT5biVzhawtt
         Ic4A6pRyU1pgKq+buzKYUF0F36bC7Swj5vOHMAKFiX7yYsOzhID9b3jaZwjZKhV3Tsxh
         r/GLeSDCEEn2PQWweVq/PvfpDUakfcy6TEGbLfMhWM6Jb2FpQWFeTfQe07jiQwAl4tfi
         R75w==
X-Gm-Message-State: AOAM530xC7Yfx/022aPOMqIypj5O4c1TeG7DzGLzuAUZ3xrIY+drJYIT
        IvMVbV0cqPWOA3eMtfC82eZraQ==
X-Google-Smtp-Source: ABdhPJyr6u9rdsK4fG3g+WuZvaXVX5tbAG7cL2mf0zOD4wuDWPZ4+xuhOwVom4h61rewPdkv5G/W3g==
X-Received: by 2002:a17:90a:cf13:: with SMTP id h19mr5070453pju.88.1601675460660;
        Fri, 02 Oct 2020 14:51:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id il14sm2472705pjb.54.2020.10.02.14.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 14:50:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201001084425.23117-2-rojay@codeaurora.org>
References: <20201001084425.23117-1-rojay@codeaurora.org> <20201001084425.23117-2-rojay@codeaurora.org>
Subject: Re: [PATCH V5 1/3] soc: qcom: geni: Remove "iova" check
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, vkaur@codeaurora.org,
        pyarlaga@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Date:   Fri, 02 Oct 2020 14:50:58 -0700
Message-ID: <160167545865.310579.3186738276930584786@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Roja Rani Yarubandi (2020-10-01 01:44:23)
> Remove "iova" check from geni_se_tx_dma_unprep and geni_se_rx_dma_unprep
> fucntions as invalidating with dma_mapping_error() is enough.

s/fucntions/functions/

also=20

s/invalidating/checking/

>=20
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
