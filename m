Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 939AB5A0E9F
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 13:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240900AbiHYLBR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 07:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240635AbiHYLBQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 07:01:16 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17481ABF22
        for <linux-i2c@vger.kernel.org>; Thu, 25 Aug 2022 04:01:15 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id z8so4974911edb.0
        for <linux-i2c@vger.kernel.org>; Thu, 25 Aug 2022 04:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc;
        bh=2Qj/MkxciUyJ2ADUj/Vlj6uBUY+YHzneCZq9nuN+Yl0=;
        b=ZTCXvMZSvvSalN1a+n3dRFCCIRiUFq+Hd5LMYDDhl0ZClsACY5wsEDB+EPA6kd78PL
         shxQCvOEdsUhFnsXLobIDcR3qbkCsAOtfilY8lO69qyocwfweksHBYXvXP8xNrbUzIAb
         o/3WW1f9dCK934zcQBaz1FzHvXDIHG4yAf85yCRc59HZBraNhb2Bx0SMJ1kqb1ddCn4N
         Tqv3mK47bbz8xp78YYlP37v9H/++UD4ejgwagihk+1OzSoMK25MqyzJQb5FJZEDP4T8f
         fwFGQbSAmqr8PxNGValYstvhLcKwXlYuyz1Stc0IRFiJGTD4RHBPz4qAqPZsQkPoTqiy
         P2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2Qj/MkxciUyJ2ADUj/Vlj6uBUY+YHzneCZq9nuN+Yl0=;
        b=gAG+cIex4lJmtD8kplrtDgeEnF8jDTgk4ZxK4b3RZLG+QSnqXEL7fCevaXHoqr6MFS
         FW1k8QmUTIHuyvILd14KpYB4y/+Pz2UqDoIDZANsPX7JXcZmgPUIaLxYOmRRyTeBHKO2
         KRFFbbFZcGM1zopYNriRZf+CtI/5mJxBKPB5fMHNdffTLB2ow9ou+pHVWoEMB46cB/0k
         dw3zgs0msx/Xi+hGH0/XnVHfeED95jWYGYMo+r3r/U88FtKNEncl1GoyXInMOV5r1XmT
         wbmVA7TRSG5eRb5o0Ehp+6CqtJAK763xBBONS4Bo0DjvFDSOis5FnWRv14UvpdoZNl0v
         6ITQ==
X-Gm-Message-State: ACgBeo3BM5ah9/Pp82GR1ursfhU2lvFNcteHjQH+Noc3T+vXq4reVrkr
        YLFO/0PSg6Tv5K7NcGiU4PMRZok2VeCGUoHrRHE=
X-Google-Smtp-Source: AA6agR73gAJBOJ8GfVExK0R0loDr+xJuy6Lte2IjQijIt8EC3uf7fe9gllc7PuKE+HaRIf5UCyT7httYaz5ex41Ffqo=
X-Received: by 2002:a05:6402:448e:b0:446:69bb:9853 with SMTP id
 er14-20020a056402448e00b0044669bb9853mr2717736edb.299.1661425273442; Thu, 25
 Aug 2022 04:01:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:c068:b0:22:a0ea:9ba5 with HTTP; Thu, 25 Aug 2022
 04:01:12 -0700 (PDT)
Reply-To: rkeenj7@gmail.com
From:   "keen J. Richardson" <legalrightschambersfb@gmail.com>
Date:   Thu, 25 Aug 2022 11:01:12 +0000
Message-ID: <CAEERoqhdRUf8=Azs_tygT3hgR0oto_9oxALdJw2VBL9=rqWOUg@mail.gmail.com>
Subject: =?UTF-8?B?2KrYrdmK2KfYqg==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

LS0gDQrYqtmFINil2LHYs9in2YQg2KjYsdmK2K8g2KXZhNmK2YMg2YHZiiDZiNmC2Kog2YXYpyDY
p9mE2KPYs9io2YjYuSDYp9mE2YXYp9i22Yog2YXYuSDYqtmI2YLYuQ0K2KrZhNmC2Yog2KjYsdmK
2K8g2LnZiNiv2Kkg2YXZhtmDINmI2YTZg9mGINmE2K/Zh9i02KrZiiDZhNmFINiq2YPZhNmBINmG
2YHYs9mDINi52YbYp9ihINin2YTYsdivLg0K2YrYsdis2Ykg2KfZhNix2K8g2YTZhdiy2YrYryDZ
hdmGINin2YTYpdmK2LbYp9it2KfYqi4NCg0K2YXYuSDYp9mE2KfYrdiq2LHYp9mFINmE2YPYjA0K
2LHZitiq2LTYp9ix2K/Ys9mI2YYg2K3YsdmK2LXYqS4NCg==
