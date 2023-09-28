Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA107B2300
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 18:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbjI1QxR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 12:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbjI1QxR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 12:53:17 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF369BF
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 09:53:14 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4054f790190so122014505e9.2
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695919993; x=1696524793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLtHl5dgLbNjnAw3aAYv97CffYGmqeg7nxDIRnuMSP4=;
        b=snkqzAbJfp1HElqDuKN/0VCRoH7v7u3dOlubE+wZ6YlWhIEnkqeBg+n+++LtoNlarB
         vw5lOyPeWMKWWqPxsa/thXUKbW+xE1SCRS601k5POgEUh///FbebZmVGvlzZ05a65YfA
         FDqjXQAV+SZ8SiU/SuAX3kX7ZIljPTSDhZx/IGZnmFPSeXk8NeGZ6NIH9GXdUJfPoZBf
         BUgaohKsPiCcUK8FYp4NHiG3rgS2O/v3LO0XQIIacFVCtwu8ZaS21dgeMz7cWPB/GsY5
         D7oi+R43QC8JY4DO5CeNJeJxGyBruhElYpTw19v22J9vzQ5ACsTzOCS2yr02dcgQwmjS
         EWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695919993; x=1696524793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLtHl5dgLbNjnAw3aAYv97CffYGmqeg7nxDIRnuMSP4=;
        b=S9sl7vP616KxxiBv1xrJjq831uAyF+1ELiQBPDeYwfjUwXOcNoU6Br8zOz+hiP4lC1
         T0DkCpglbltDESxvzqqUoKz62pCP1OmQgFeYcu19HtYvCmxYWVA9s5cfqMoru2za2WBh
         EzrJH8IIY75y5ZglyoN+6XkNiisfnVO0mpOIYpTyh09hRwSYvvojWnhyQH0o9Mj+sttt
         mRzlfg/JIrQVnSnO6WHg9N6quBU6X5Gib0MQRHyCrr6Ptd/5y0SKwiKmE3YgaiV/Z7Va
         iFhkpCTLpSQdHl4Q2KKBuNVleOYQIw4E71g2AladoIGmXv/yq+mL/6EkpIKVjjWHF4Xp
         ntzg==
X-Gm-Message-State: AOJu0Yx4bKVCwDMPD1FeSDAF3l7wlDx8/XroVNLKVt89Oqe32Z4p06dC
        yb6iPYVkijVxsTFhVLdQ9cDwPRNoJcarVTsKoMjJ0Q==
X-Google-Smtp-Source: AGHT+IERuxSFIT3mN89dFCSvtqR69OU6AEhY9DC/pZMjQidTLDJcwSGCCpeZh0ittbKQwsiz+UUXa8IVg0UU3g0zhC0=
X-Received: by 2002:adf:f989:0:b0:31c:8c93:61e3 with SMTP id
 f9-20020adff989000000b0031c8c9361e3mr1470396wrr.60.1695919993046; Thu, 28 Sep
 2023 09:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230928101655.47d3dd2a@endymion.delvare> <20230928150323.7modfno7snqccpzd@zenone.zhora.eu>
 <CAKwvOdkw-13grHe6NXrPpyxtH1VxHshVo3rY31iY=V8kk93fMg@mail.gmail.com> <ZRWufynzIX8EYOpA@shikoro>
In-Reply-To: <ZRWufynzIX8EYOpA@shikoro>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 28 Sep 2023 09:52:58 -0700
Message-ID: <CAKwvOdm2X12TY_ye4sgqJDXgOYsYWT5-EepCX+uHN-xExU_y+Q@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: Drop legacy muxing pseudo-drivers
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 28, 2023 at 9:49=E2=80=AFAM Wolfram Sang <wsa@kernel.org> wrote=
:
>
> > I think Wolfram wrote the drivers.  If he's the sole author and stuck
> > with maintaining these, I can totally see a maintainer saying "it's
> > time to put this old dog down."
>
> It is Jean who wrote the drivers. But your reasoning still holds true
> for me.

Oops! Yes sorry for mixing you two up; I should have commented back
when I checked the git log and noticed that so it would have been
fresh in my mind (or just run git log again now).

--=20
Thanks,
~Nick Desaulniers
