Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECB43530518
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 20:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350150AbiEVSId (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 14:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235686AbiEVSIc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 14:08:32 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F91396A8
        for <linux-i2c@vger.kernel.org>; Sun, 22 May 2022 11:08:32 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id 68so5403362vse.11
        for <linux-i2c@vger.kernel.org>; Sun, 22 May 2022 11:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=4hUaSXaHzjczvt+K8DB1HuwyzZD1B9K35zixlJyvMRg=;
        b=mEu+JPKeY4XgA5oQpQicD7jvXllAP6FlheuOcwABZ2OXaUi6XShtsFfjLzYxC3Vw69
         gbIv0e6QavgHWvr5/sY31yHwwfrTQcgEBLQqEUblIqGKzoB4eKdaj24zyTlbY5AcSkgl
         glayVX0UU+BF4Z7nqUNM84mRCAQA1b50IxiHnwYdkEIf7IUNlMNsO+ULQWx9qk5tRUYF
         BfLC69plKrod3K8eYi8sFdu6qbbnADpBtDIJHNBvcuwNhA+W/zJzUQk5SfUe6kzZLDsZ
         ONle5FF09WSYo5RpI0MmFIATFytSs/CsTkqPAa+HsXqXwpIIiN5pKZb0qur9KZS2M8nf
         JRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=4hUaSXaHzjczvt+K8DB1HuwyzZD1B9K35zixlJyvMRg=;
        b=2VEyICiFogG71Shwqhoco7DTZ4w/kHFyv+8bdpFWPUQ5Gn/afG0l7XcrmKpVlqWRfB
         UrZNCPzQYERX3L7fYIPDkT7hBiwraIXP9/DW+pbuZKASt7bZ+1/mo4QmXKZUjfZqtrDl
         DAabCOxalDwpOJ8CTsPPDJYVfndHm0Rc35kWqeYc+bRYGz6ZmECI5Ho6uQOUf0qPvP9a
         3IORufUPN4G/nb/AEO6ERgCQ3cG2FLCOO6B+vP97bJfj3Z38Zynk8sgjE4HJWaxyD1BQ
         9rD1VsZvxdcFcRz59K0JeAr3WOtFHXpywHTZTe/y0T9VeCG+xantq0kCk/QqJJWjQa8O
         ieRw==
X-Gm-Message-State: AOAM532jyI4fL6YHgGoHFkGVsRWReTjErMZZn+SEijBrtU0tDcL4db9G
        modCN6Yn73v9IGYcU8dLuxD1seQThrnQtGsPZdE=
X-Google-Smtp-Source: ABdhPJzM9bJOZvyMepfuwTHKOrSGhvi9rNGl1WjpslrkOgsAYpfKo0ewxWo1mW22PM68HOd9YgE8toSnXVHRx3hFsTo=
X-Received: by 2002:a05:6102:c8e:b0:337:bd8f:3fc6 with SMTP id
 f14-20020a0561020c8e00b00337bd8f3fc6mr52846vst.55.1653242911395; Sun, 22 May
 2022 11:08:31 -0700 (PDT)
MIME-Version: 1.0
Sender: tchelebassiabasse@gmail.com
Received: by 2002:a05:6102:366e:0:0:0:0 with HTTP; Sun, 22 May 2022 11:08:31
 -0700 (PDT)
From:   "Capt. katie" <katiehiggins302@gmail.com>
Date:   Sun, 22 May 2022 18:08:31 +0000
X-Google-Sender-Auth: 0YrFLoBcx-LLCZuEFux5vHtPgRI
Message-ID: <CAPL9QRU6=3w=CjEWLixJx52+rk5aQb1427smzTeeL0ee+sDJoQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

You received my previous message? I contacted you before but the
message failed back, so i decided to write again. Please confirm if
you receive this so that i can proceed,

waiting  for your response.

Regards,
Capt. katie
