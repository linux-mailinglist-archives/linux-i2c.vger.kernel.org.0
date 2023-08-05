Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE06770E49
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 09:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjHEHKn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 03:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjHEHKl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 03:10:41 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5FE4EC7
        for <linux-i2c@vger.kernel.org>; Sat,  5 Aug 2023 00:10:34 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1bbafe6fd8fso2171874fac.3
        for <linux-i2c@vger.kernel.org>; Sat, 05 Aug 2023 00:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691219434; x=1691824234;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=NyNlKvPPbZwPdwbvM4R7L4KsFgp3jG/Yz8y0NIeYmHHJ60z4qQ0fFsmVqW5esDEuDf
         Fbqb+ORnggRsV/pIEqpEs2yu0/YKs9pD6jA44sJjckZFJjWrjZBCnh/Qr2sUsU07kv/L
         knrpJt9C2u1G8+0sdBqb9VFAcBcWQ2JYMMxTgjqLW7TyJXsECfnZsYbDZYGJ021hruds
         b6SdMq+LgNo+QKk3JacoNYu0EnUkuxmqbKFjmLhHHZPwIyuceqH6PG6Q+pUXtQFhKStr
         M2rb43D0N3l+3Xip2MB2BqiSWg19UTdKtnT6XoQJbsYEQhcYm4qjsLppLqXS05iPpnha
         xk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691219434; x=1691824234;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=mAR0xiHt0LvQ9/HVtMSaYp13Y/HOG0ZZ2HNqQezfYrRusahzxtbI0jWbD1cTPaUPdG
         5M3fG92WBTU0gyRThYxO/c8c7j86a0FWVoPwtOtzzxIMJQ7w1wHPbnGzvhkaJbxwB5To
         NJpV2Il/e7y6p/Edhnzdh3BPtyG6m3M8a/qXU4uB4NyZmbAbsMKx3H3uWRQU2GTkKqhm
         xtDM51qWvi02f9QOUuaq06fTEx7s3h6MYBcmN50cicgEzEIDsR8uNBnAP7mXmFk9qrnf
         eVHtOMCUhMJ9qx3zOROy50HAscPdbNpTP7yoPKLEcurWjw/YIfumKA7/c46OnadgXzCi
         y+Bg==
X-Gm-Message-State: AOJu0YxebC6DmkvdG5ek84ksZQscP/HXlosQtFPBJsI6fR2G2FngrbLm
        SCr5JY0f03t7WAMrcOoAMsNDXtoElJ278N6Yn+Y=
X-Google-Smtp-Source: AGHT+IGH02H39PMw0xWk2K73MYNiRITBuX4ZDWp2liYw7rTO89dOBjJ0iYsV4KQAkBpBZGnEOASHFzdP3NjhzY7VCto=
X-Received: by 2002:a05:6870:e40b:b0:1b4:4935:653f with SMTP id
 n11-20020a056870e40b00b001b44935653fmr4895301oag.49.1691219433722; Sat, 05
 Aug 2023 00:10:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:c0b:b0:d3:811f:e55d with HTTP; Sat, 5 Aug 2023
 00:10:33 -0700 (PDT)
Reply-To: bintu37999@gmail.com
From:   BINTU FELICIA <felicia712@gmail.com>
Date:   Sat, 5 Aug 2023 08:10:33 +0100
Message-ID: <CALG3m0HXrMBzFna_RyFNFMdf46PasvpWcv8ApUVmb8Dp2_zhfg@mail.gmail.com>
Subject: HELLO...,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

How are you today? I hope you are fine. My name is Miss
Bintu Felicia . l am single looking for honest and nice
person whom i can partner with . I don't care about
your color, ethnicity, Status or Sex. Upon your reply to
this mail I will tell you more about myself and send you
more of my picture .I am sending you this beautiful mail
with a wish for much happiness
