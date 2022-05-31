Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 426C35392EF
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 16:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344786AbiEaOJY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 10:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235298AbiEaOJX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 10:09:23 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1CA64D10
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 07:09:22 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id n13-20020a17090a394d00b001e30a60f82dso2803193pjf.5
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 07:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=93IUvByvbQ5Fw18jKg+mGDXYGbF6YTatIAwjc4Egg2A=;
        b=fP/iHr2P5Q6MkGmg5sXK3EoLqByVPuaz1BAzB7q8tUz6KfksSQAoVnRAH7OxCb24yf
         hEj1c4FISe3OzoRBfTe8cWaiRxK6I2JLAwzXU1T85fVjbmfDKAFlILpOE+7HOuMzNqjU
         RUe8lc4vN8fGEi6qQf+wiLo0aLEBXY8gi7QBVHsNAArIO9L2a3f+JGwflPc2YTKC7VaA
         oXJEebP0hCKMBBnYxouEyYOdTsy/E+8uTN4vjYXElvVS+BjC4kV2rvjr18n2S2e8H4hC
         g1ruaf3KYXYFlkIVur0ONcpy8IQXx6mgw88dVJ4YTrmVKy5S+qwrLRgCpx053kuKDY6L
         rjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=93IUvByvbQ5Fw18jKg+mGDXYGbF6YTatIAwjc4Egg2A=;
        b=1W8tXPxTSOB4fFLMDWC3gcrzrL+OAITIovqMBz597e0a4dxB269lV330f6Dzdzl9zl
         EVE5gNF0elsUSE9MSGMfUe+/DmJJ3m8dQRFA8XogCYgntz63U6WQI9yxvnV6eAYXOV3H
         uYD+mD2SENsnwQ3wQvKJcYffmfv4MJJ/ZZoetp+PpNMVjmCeQBuHR2YHZdAROYYHjJPm
         /eGCfjqtIOiGs58Sr56ciX1DF2IqakF8rkdIqS98HTGD+bYioQvJ7tnoxEzg3pcv3LG3
         0NUqXNEVXmx9DBj7n6MuGs9vSaSlWWQLnPp+AwGKESjwhuWWfBL5bt9YDsaJ0qe3JB8a
         Mmtw==
X-Gm-Message-State: AOAM5310i07n8F4gakRlfekwUkLebGtpYelHXHNWa1yqg3rkyGicHidC
        FiwV9RxSMQOgm27V9NI6Ki7k4NN6n+DQ9K8eK9I=
X-Google-Smtp-Source: ABdhPJy6qGyVYl376yyIlY5/v1dvb0MCnZZc7Qy1FjkZwwfSB3tgwP0P8GijaAist6Yyg4HxzRRFNr3bJZE5knDVpIc=
X-Received: by 2002:a17:90a:ba15:b0:1e2:e76c:f725 with SMTP id
 s21-20020a17090aba1500b001e2e76cf725mr13419240pjr.7.1654006162447; Tue, 31
 May 2022 07:09:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:4a52:0:0:0:0 with HTTP; Tue, 31 May 2022 07:09:21
 -0700 (PDT)
Reply-To: thomasjoyec@yahoo.com
From:   Joyce Thomas <jennifernanaama801@gmail.com>
Date:   Tue, 31 May 2022 07:09:21 -0700
Message-ID: <CAKv0FJPBug=TSTaj5mW_YDaAnOpG7WpRcuNmvfC04vKRoy9npQ@mail.gmail.com>
Subject: Hello Dear Complement of the season
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Dearest one,
Good day to you today and how are you.doing I hope all is well with
you; please did you receive the mail I sent to you since three days
ago?  Please can you be kindly get back to me  so that I will  know if
you received the mail I sent to you or not.
Best Regards,
Ms Joyce Thomas
