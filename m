Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D67875902B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jul 2023 10:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjGSIXU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jul 2023 04:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjGSIXT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jul 2023 04:23:19 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAA5E47;
        Wed, 19 Jul 2023 01:23:18 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b70404a5a0so107551181fa.2;
        Wed, 19 Jul 2023 01:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689754997; x=1692346997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DohGz6VEowRbgvgE/wkjJVFhC+k1Zhd2ZdGxcIPh6rQ=;
        b=st2pN/z8+mIkcC4P6AArBydMm4TFL6zJY+KbqmrnIWRbR5BtCS0aN8Q2nn6znce5m0
         cmz2kjs+cdc+bQ/LRI3zqO+BhLmBNO8q4wbE5ikIN7j2gEFZVlYPnVZu4crrfKZijtUE
         KKnmVDtCSgjjD6vOUXXWJzNc7uKtTTGauiy7LGAt5YVSfpSsqWXg7QX0bEzZJd9av9rY
         NZ6DaXiog2r2D224u8C7bhjaFk/c/meGb3dwZiFLP0SkwSHRefoy9aA4XKJAcDmdzRr/
         kIfb1a1tYzopotO0ubJxDLSGt8yTOEU+44IoGTBdyoZq40tfhhKLRnzYvkr4T3L4+/r1
         yvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689754997; x=1692346997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DohGz6VEowRbgvgE/wkjJVFhC+k1Zhd2ZdGxcIPh6rQ=;
        b=h8GiqJ9tZgmZ7rgRD6lP+PH3v8HbxnbAuST7/PusGe/+gkQpFuzLc0nfQjrGlXEJZQ
         4p9Nf+epO7ekEbpXUib7VlRuU1LLYO8J96CqOmrMI33QQdXukvk+LiGb4NmF4dlO6c3n
         ddAYdve97k3omtDl2qM/gA04Afo+cUOhl9JwZnYAwualdjyJumHtI6lrxMfNVUxW24k6
         rr7mOVAGV/TacWOOlW4j8wl3WtBdnCi+ilLQBuBGhT0zSeucZ7YEvqEJ4wVQTgKvSWUe
         2/VNPhUNB862bSty2kLnxvaC02ggoVi1C6pFXdeCzwNYkeeiTTJL7iwTuuv9SiCzcaBB
         F0ow==
X-Gm-Message-State: ABy/qLb0f6JtIacV51VUuPiQYe1y0dO2HOjESfDzwwHWHX9E58RUiuwr
        a31PxatTWXLoaq3O7x5nTds=
X-Google-Smtp-Source: APBJJlGMvkyJcCiODD00MqjTQusP7EQzJMPlB4LTu8tiJ6JyEhO/Ji0ltP7JcLtw5rtMtrxuAFcC9Q==
X-Received: by 2002:a2e:3a14:0:b0:2b6:e618:b597 with SMTP id h20-20020a2e3a14000000b002b6e618b597mr16791001lja.28.1689754996546;
        Wed, 19 Jul 2023 01:23:16 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id dk9-20020a170906f0c900b00988a0765e29sm2005844ejb.104.2023.07.19.01.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 01:23:16 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
To:     dmitry.osipenko@collabora.com, konstantin@linuxfoundation.org
Cc:     bbara93@gmail.com, benjamin.bara@skidata.com, jonathanh@nvidia.com,
        lee@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        peterz@infradead.org, rafael.j.wysocki@intel.com,
        richard.leitner@linux.dev, treding@nvidia.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org
Subject: Re: [PATCH v7 5/5] mfd: tps6586x: register restart handler
Date:   Wed, 19 Jul 2023 10:22:51 +0200
Message-Id: <20230719082251.3501424-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <215679f1-a866-1e92-1bab-9c80918927a6@collabora.com>
References: <215679f1-a866-1e92-1bab-9c80918927a6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dmitry,

thanks for the feedback!

On Tue, 18 Jul 2023 at 06:46, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 15.07.2023 10:53, Benjamin Bara пишет:
> >
> > Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Acked-for-MFD-by: Lee Jones <lee@kernel.org>
>
> Acked-for-MFD-by isn't a valid tag, scripts/checkpatch.pl should tell
> you about it.
>
> In general you may add a comment to a tag, like this:
>
>   Acked-by: Lee Jones <lee@kernel.org> # for MFD
>
> In this particular case, the comment is unnecessary because Lee is the
> MFD maintainer, hence his ack itself implies the MFD subsys.

I saw the warning, but Lee requested to add it like this [1].

@Konstantin:
Do you think it makes sense to print a warning when adding "non-standard
trailers" during running "b4 trailers -u", maybe around the
find_trailers() checks? I could provide a RFC, if considered useful.

Best regards,
Benjamin

[1] https://lore.kernel.org/all/20230518094434.GD404509@google.com/
