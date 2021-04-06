Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C474F35544E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 14:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243371AbhDFMzt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 08:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243380AbhDFMzs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Apr 2021 08:55:48 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568EEC06175F
        for <linux-i2c@vger.kernel.org>; Tue,  6 Apr 2021 05:55:40 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id k25so8512488iob.6
        for <linux-i2c@vger.kernel.org>; Tue, 06 Apr 2021 05:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Hbwd+YCIGcArHXDLOaOgaDXtF1rGTjl7XVhRNNFoySo=;
        b=QFEDsRbCyPVDmQm5QpFyxb7BE39ncBLFfPomgSIHQjrM+p7DEnnvsyqNYUUQFhWJWJ
         ZIvjuhSZfcFTreHkj+Dfj1CTZo0kNCzay5yb0aGMoRyxKa8QcggXrT2iFtChL2n2CZQz
         eR5wdBvPdv7F53cBM44XkTMTTpEYly6y3dtVQeKy2q13GJjupy7qLg4ii2F9nJ4dHxFx
         AbF4TYtvqkNtKuWEOD4lOkZz/Cvsv8d4slQDfN4sJQnYvhsOiEmWr2/npntQWiNEFHYe
         UMfnnRPNac17kQUTbgNqwO3HhVTTl40jWvWpFJgAcAavfTfDVm4Zzkf/hPEJXlAyuX7j
         1IZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Hbwd+YCIGcArHXDLOaOgaDXtF1rGTjl7XVhRNNFoySo=;
        b=IZ8ae/TEofLC70JkJA6Z7dmCWPBV9U0huP+cfs+/A4ML7/596pQpAY72jVTqLfL8cO
         vMEtxdV9ij8yGWfBHRO1Hrayt4rnCBq3j8Vl1WvHW35aUn78ZWzzZ+xZEfWkjBJMXhHy
         JnOHwkqs5+HhqdGA+UHRnkiZGNjU/iCUImmYVifDzHKHR8uVbvMc/iB6xh/v7m6B1azr
         Nk/v3o0HqX5Je0MRddkI0UVnnF3sEvmee9mQCQSw9N6Ell4jkb7qCJnXAbnIBoNwG4Y+
         hMdV09qFeYnmXkQzSlfvrdJyWTxguv1Wn5o+P9dc/68VXu3DEIlFXXgSSKRltP7rK2rB
         ROEw==
X-Gm-Message-State: AOAM532i5p4QcdqR5c45oHZOAOOh2mT8Q90yv/G9C2TJ8X6I1Wm4xWW3
        GN+QB/JB9azk4SuMiLrlYDnrfJfGJS0Ap0IWr7U=
X-Google-Smtp-Source: ABdhPJzetg9Pb512p5grRZPAKl7L9IyXC5Me9/FtTtKAdn4Tm2QPuLywVJ2/TLve5FVEiaoJRaM6T/qcFl0Q00oZ7AY=
X-Received: by 2002:a6b:c997:: with SMTP id z145mr22992631iof.36.1617713739452;
 Tue, 06 Apr 2021 05:55:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:2b09:0:0:0:0:0 with HTTP; Tue, 6 Apr 2021 05:55:38 -0700 (PDT)
Reply-To: sroomf70@gmail.com
From:   "Prof. Dr Diane" <dflint909@gmail.com>
Date:   Tue, 6 Apr 2021 05:55:38 -0700
Message-ID: <CAFe5QT3nx89Vf5Yv1qQr_VByV5JLeMA66y4WMi4KYigsUHxW5Q@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-- 
Greetings,
From Prof. Dr Diane, we notify you through our official mail but no
respond from you before sending you with this private email hope you
Received the Fund that was paid to your account? do not hesitate to
keep us notice as soon as possible to enable us make the balance
transfer into your nominated account. awaiting your urgent
notification.

Best regards
Prof. Dr Diane
Head of Foreign Operation
