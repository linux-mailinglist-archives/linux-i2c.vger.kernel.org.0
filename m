Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38D42F44B6
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jan 2021 07:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbhAMGzW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jan 2021 01:55:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbhAMGzW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jan 2021 01:55:22 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1404AC061794
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jan 2021 22:54:42 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id p15so439457pjv.3
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jan 2021 22:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=qIzSFaJn0FV4+gH+m7p2CH+i+vBGSXoqXRe/PphI9GE=;
        b=RT2d5E/rPk+9t6CZy1xVT732nLbD343U9m5o4mfKELaR6aLv5jAvRTSp/4aAAQPVxi
         iHmNtEmklCFfs7CU8K/I0XSJIFpI0lQt5R+DGqHibLLUMvpO9O0GwUItXLrz8UO4rATt
         hRX+Brqe2wsOUTgwNm/ELeO+BidoIFH7iKuck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=qIzSFaJn0FV4+gH+m7p2CH+i+vBGSXoqXRe/PphI9GE=;
        b=i4kbtVihHUY81sZGyVuxV3aFkBKOsllaxXjJmkHx9MxGN6SW/uKt4dC+2Ls3z9cy7G
         qypDx8R3U/r9g+6vyIyCjgutXFzM+XlG81gOK5bLZjDPNMklwNt8+RQCJpvZN95kvjhH
         2xh6ecezchtNNgp26N+6WXVDQb4m2BEkprDpGbMRe7gQgp2adnCaFsLYoU2sYuFUawJV
         oOgJgSguX8b2eJhvG/SIKgp9qP/Pcna0I2BOM+eatwRhqZEQqN+Q7S/ZNdDBRwP9x5K9
         9HRZXPJuxGUsH9fHu55ft5OD/z58UjoUp5yZhR+kw2pq/M8wz+saS//69bWU/FSca5lk
         k2Aw==
X-Gm-Message-State: AOAM530bj2wVj5OkLiYCwPY0lJtCv5oYnpDUn6rKn689fR2ytZT8PxL2
        V0iL0IlxMaN6/z7jkywZ9SMHBg==
X-Google-Smtp-Source: ABdhPJzMkz23cJKP0paRkkTSsY82QftftvcCPG3Ruv/ETUrI3H5mSAMZ9konil1VBXTHGhwEpJIGgA==
X-Received: by 2002:a17:902:b484:b029:dc:984f:8c5f with SMTP id y4-20020a170902b484b02900dc984f8c5fmr931715plr.4.1610520881526;
        Tue, 12 Jan 2021 22:54:41 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id b13sm1307187pfi.162.2021.01.12.22.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 22:54:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210108150545.2018-2-rojay@codeaurora.org>
References: <20210108150545.2018-1-rojay@codeaurora.org> <20210108150545.2018-2-rojay@codeaurora.org>
Subject: Re: [PATCH V8 1/1] i2c: i2c-qcom-geni: Add shutdown callback for i2c
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Date:   Tue, 12 Jan 2021 22:54:39 -0800
Message-ID: <161052087940.3661239.14609415796697267628@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Roja Rani Yarubandi (2021-01-08 07:05:45)
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 214b4c913a13..c3f584795911 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -375,6 +375,32 @@ static void geni_i2c_tx_msg_cleanup(struct geni_i2c_=
dev *gi2c,
>         }
>  }
> =20
> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
> +{
> +       int ret;
> +       u32 geni_status;
> +       struct i2c_msg *cur;
> +
> +       /* Resume device, as runtime suspend can happen anytime during tr=
ansfer */
> +       ret =3D pm_runtime_get_sync(gi2c->se.dev);
> +       if (ret < 0) {
> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", re=
t);
> +               return;
> +       }
> +
> +       geni_status =3D readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
> +       if (geni_status & M_GENI_CMD_ACTIVE) {
> +               cur =3D gi2c->cur;

Why don't we need to hold the spinlock gi2c::lock here?

> +               geni_i2c_abort_xfer(gi2c);
> +               if (cur->flags & I2C_M_RD)
> +                       geni_i2c_rx_msg_cleanup(gi2c, cur);
> +               else
> +                       geni_i2c_tx_msg_cleanup(gi2c, cur);
> +       }
> +
> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
> +}
> +
>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg=
 *msg,
>                                 u32 m_param)
>  {
