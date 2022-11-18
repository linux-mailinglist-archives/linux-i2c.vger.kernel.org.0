Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4A862F316
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 11:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235073AbiKRK6Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 05:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241306AbiKRK6W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 05:58:22 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2623691527
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 02:58:22 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id g51-20020a9d12b6000000b0066dbea0d203so2830134otg.6
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 02:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vncsyG2Nyfjk3fMNS70hjMFlG/FlOMW1qYnES7GA3KQ=;
        b=YHdbBLgYz4Utec20V5tu/BgitMLCcpJQExNK7YEO9GI/PAk763gUWWXAmkS4BFuFfb
         UhsiJsS0Xok3jMWoSJYLzMHJ/GKPC7XFPKPPSz1fG8kH8Mehh6VrrivfiFhsrVq3biyo
         p0/D1/2a8U6NJ9w71Ul43cjhdosRZjZj8TaG6t/uKMK19T3nslXbmjzkMl1aIuPt0nSz
         g0DCMAEFmJC5jQKsR/pyzTcz0+KcTOV5QJ2iw6DH7d9eh635Peh5k3DTeEXdYb6e4Hdy
         NsaN5/sPsl1L8y+9yPjmO8cvWx7IUiCOjF/6+eICcSiKHA6KSspfW0H6i2wv509E71V/
         am/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vncsyG2Nyfjk3fMNS70hjMFlG/FlOMW1qYnES7GA3KQ=;
        b=Ow8xVG31QlNapK0KJaQ64PizQ+iRvzgtXbTP9PYwHfVlNd2ZzI5MhcLJn+yQ3nnWnu
         ztsYRVv5C4rcwMu02soxqXbaePfDlnpCsJ+gVAjGeIGsf212NsBpS17Cz5+2Pt++VH8D
         7eZY0p7AlPSWQTq8657W7ii7+sQWGqH+CQdCwJsVxLg+dUR5mudfUPr715pRSP/TFLXj
         Hycjac5x31QKZide1/Bi3d+cGi5GM7dtEdbme6kX9V/baM+5GJZJxp9LSdc07O0tmo42
         k1UAPEu+lVbOdO/PWeEQZbvvKFKlrZybfe7Pt+vjGG25515j8Mnh7687+/ERI056zWl9
         rdZw==
X-Gm-Message-State: ANoB5pn0wz6sPPd9S74uQIoUWl7e31h36fECR4zG8AR5rHA4i/0dgjpC
        +fOTjIh1RSYHVHL6ICb9CFGRXXPHTz7wAkmLbqE=
X-Google-Smtp-Source: AA0mqf5Gjl4WrndnxpjizNgxEoY+WEcMlZ+u3T1/dxL2/ytaV/avNy7K6tUBZwyuSGPWAvzHMmj74iJd8bOuGb0VAXE=
X-Received: by 2002:a9d:66c:0:b0:655:e3c3:f66c with SMTP id
 99-20020a9d066c000000b00655e3c3f66cmr3470782otn.344.1668769101462; Fri, 18
 Nov 2022 02:58:21 -0800 (PST)
MIME-Version: 1.0
Sender: fredadiyo@gmail.com
Received: by 2002:a05:6830:349d:0:0:0:0 with HTTP; Fri, 18 Nov 2022 02:58:21
 -0800 (PST)
From:   Miss Sherri <sherrigallagher409@gmail.com>
Date:   Fri, 18 Nov 2022 10:58:21 +0000
X-Google-Sender-Auth: 2RN6O6cqBf-n_jfWi6JNMsIgdUs
Message-ID: <CAAS6DFkhWwjSDi-qKrt-hdu5qQvYHLwx7W_PkpSi4=xVpZkzXg@mail.gmail.com>
Subject: RE: HELLO DEAR
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_HK_NAME_FM_MR_MRS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Witam,

Otrzyma=C5=82e=C5=9B moj=C4=85 poprzedni=C4=85 wiadomo=C5=9B=C4=87? Skontak=
towa=C5=82em si=C4=99 z tob=C4=85
wcze=C5=9Bniej, ale wiadomo=C5=9B=C4=87 nie wr=C3=B3ci=C5=82a, wi=C4=99c po=
stanowi=C5=82em napisa=C4=87
ponownie. Potwierd=C5=BA, je=C5=9Bli to otrzymasz, abym m=C3=B3g=C5=82 kont=
ynuowa=C4=87,

czekam na Twoj=C4=85 odpowied=C5=BA.

Pozdrowienia,
Pani Sherry
