Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 684D77B9EDA
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Oct 2023 16:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjJEOOl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 10:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbjJEOMS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 10:12:18 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50102350E
        for <linux-i2c@vger.kernel.org>; Thu,  5 Oct 2023 03:51:35 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-278f0f565e2so549420a91.2
        for <linux-i2c@vger.kernel.org>; Thu, 05 Oct 2023 03:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696503095; x=1697107895; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09JQzmtyLsdfsuWxokI3+phAwC/1Qp4evmiv2CRpzIw=;
        b=aV+AdQ63BL9jncXWeZWSGd+U110oIxUzHe2t8UOldFiKOUqFrmFIbWu1ZbIghDVikM
         OidpI3c+zpAtW4Q4zjPGDtpkIDA+rO3AB0MV9e64NJR1cjbmgZDKj8ywQIglLsgpBBdS
         aU66Yrpj5ctcus5t0xpzDJBjGruElav/DKLPj4bewU8QIhVCMHVJdrAB3D1l4NaaimZg
         +AmHZ7NP+EZjxtudnDawWdcl7jQszxsfiyuFfyes6krNSWLYfCratzZ8glCyhY5gUNHx
         tvQyGkA4HfoZHs9bTgOIAFCBnQGCDuz8buFGf2E/Mvoie1UZjXg2h/EncU6Y634iuDz3
         vN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696503095; x=1697107895;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09JQzmtyLsdfsuWxokI3+phAwC/1Qp4evmiv2CRpzIw=;
        b=VhHyUmJnlX8zULVjUhpNYlen2HoEaSht7gEYruchrQmHFXWkH3chrf1Ba66mWaFF8b
         w0O9wJcqk9hmDmV376KjU/2vmXpMOcjJ0WutQeROTs5tF2xiLVfC2+oJUfmBKyGq4CMh
         shBg5vpktxHanlU6ncLP5OQ+BHvSDO81JlR1rDWnOCbqkIG1ujk7HFCd9CjiXmqleFnG
         TKzzqclF17lUniM64xwKbNEdfbnQ5HDTfW/LwCtjAtEAsaLlgyfT0lBDTJazNniE8jrU
         1rG3dhM/jG9pS/jPURzkTreRGOfW6i8WGlZcBBZ8MCLgH3SO/wpEJFdh1hWvaACcMxXV
         ix7g==
X-Gm-Message-State: AOJu0YxJqLMce7phAn0D9V+gKKqiFFYY5KzZ9VBFLOIiBw6MMitrHl55
        goNo+QQeCCHZqBuLWazaAAhRded6/gI3tJwZujs=
X-Google-Smtp-Source: AGHT+IELSiQ3Ybu3x0kN2kVY/vZPftf6Ke9SbHNioalMtRqxTXjknRGdTp7qDZXPBFXRE02zJyKKDw6ietRs9SAbPbk=
X-Received: by 2002:a17:90a:d998:b0:274:1bb1:415a with SMTP id
 d24-20020a17090ad99800b002741bb1415amr4457094pjv.41.1696503095030; Thu, 05
 Oct 2023 03:51:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:c6ce:b0:4ec:e83b:92f with HTTP; Thu, 5 Oct 2023
 03:51:34 -0700 (PDT)
Reply-To: diak_s@yahoo.com
From:   Diak Security Seals <samsoneso1@gmail.com>
Date:   Thu, 5 Oct 2023 12:51:34 +0200
Message-ID: <CAHVqMBbBsCO8x59gXvteogachJnJ+yB+xTG-wLQmmi8CNp2s5w@mail.gmail.com>
Subject: DETAILS
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Greetings,
I came across your e-mail contact prior to a private search while in
need of your assistance and attention.

I would appreciate if you could reply and I will funish you with full details.

Sincerely,
Diak.
