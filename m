Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7075244CB4
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 18:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbgHNQac (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 12:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728434AbgHNQaa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Aug 2020 12:30:30 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E321C061384
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 09:30:30 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 62so8866596qkj.7
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=YAr3KBCGnjJVZH2vMQV5k9iut1N98ajRDnwwX1524TE=;
        b=Eu7WJlssHQ06bXk/ahJY7R03x30PYti86JPghXEl9SUH8mA/Bh2fcjNtrBjQ/jlSUc
         JkkbhTIiMgVfXUEIPnhLJpW5cJ+B7R8cH51EcvNs0MGvgANjdmbmSc7QKBEf0DkF9Fut
         25HDlUs+tWuo5Ur+z8ortfVeGHzHRv4sEzK1UndubV9M1OS02HdeF61geXAuDf3AHX95
         Ccx/f8+L+mn5dmbk2s/BxweZcHOPXTpJGTlon2XzfrKVm3OIyf0OD2cFkrYKEtPH2mem
         Sot+ecLssAQiHM6FAv1gVAJ1cBQ03ibwdQd6jBIZdK2vm4LaFw1dh2VG+k4h79m/pipW
         8+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YAr3KBCGnjJVZH2vMQV5k9iut1N98ajRDnwwX1524TE=;
        b=AGhimTD813adTjrpaPhWgFzP9eG7tKO2H8CofoAa8RiHzaAUpdQZhx6lDBZfTCAlmp
         HLpBVDNKlP4JqB60TXP3hl7V5qasELdrh2y9bNwv6va13mfSS7yhv0t34ZDGmHWQ1rKf
         2+HQr5Cgb9e7wVJRPDFEapIOA6ilKG1Z98m6r1JmH2dFUSxfqerblU13ufPv3H7fQzQW
         fMbhn+oQ1OI4uCU7zitbrlqqvRfB7kXvscEiewQA9H7Rf39N5VT2xFHvAmSNmXlSBf3y
         3mghlTXa08LUp3tETNJwsE0gY2DdiIdE5FsOEYT5Y6PpJtLd4BdJrc4Fz8hxNenhCIhr
         tg7A==
X-Gm-Message-State: AOAM530t1O9kW4Z6T0IZ8A2ptnxoADsAGUvtqYLUwZJ7CFoRyfvlAH/i
        KDY7d0tpnQotBw2hnG3Zt/ny3KNxacrmFlLw
X-Google-Smtp-Source: ABdhPJwpVyPa10/oA1pIlwdCz/rhOy/1KH3HtUwaartd0zqwiNSWEoR6S3MopkCQ3Xtkw/f2auIL2Q==
X-Received: by 2002:a05:620a:102c:: with SMTP id a12mr2712743qkk.47.1597422628917;
        Fri, 14 Aug 2020 09:30:28 -0700 (PDT)
Received: from localhost.localdomain (ool-45752a48.dyn.optonline.net. [69.117.42.72])
        by smtp.googlemail.com with ESMTPSA id r6sm9011884qkc.43.2020.08.14.09.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 09:30:28 -0700 (PDT)
From:   Mohammed Billoo <mab@mab-labs.com>
Cc:     Mohammed Billoo <mab@mab-labs.com>, peter@korsgaard.com,
        andrew@lunn.ch, linux-i2c@vger.kernel.org
Subject: [PATCH 0/2] Add gaisler support in platform_data
Date:   Fri, 14 Aug 2020 12:28:02 -0400
Message-Id: <20200814162804.29110-1-mab@mab-labs.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patchets adds different endianess accessors for grlib and adds
support for using them using platform_data in addition to the device
tree. This is for instances where the ocores implementation is not on
the same silicon die as the CPU core (e.g. PCI), and the base address of
the corresponding IP must be determined during runtime.

Mohammed Billoo (2):
  i2c: ocores: add gaisler to platform data
  i2c: ocores: add be/le support for gaisler

 arch/arm/configs/socfpga_defconfig       |  1 +
 drivers/i2c/busses/i2c-ocores.c          | 55 ++++++++++++++++++++++--
 include/linux/platform_data/i2c-ocores.h |  1 +
 3 files changed, 53 insertions(+), 4 deletions(-)

-- 
2.17.1

