Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2943A1C9EE2
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 01:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgEGXFy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 May 2020 19:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726531AbgEGXFx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 May 2020 19:05:53 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C56EC05BD43
        for <linux-i2c@vger.kernel.org>; Thu,  7 May 2020 16:05:52 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 7so4381697pjo.0
        for <linux-i2c@vger.kernel.org>; Thu, 07 May 2020 16:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ALRsMRpYMQGhTl3M7F2q6n1Ivfp3wJoqu+LD2z2YD60=;
        b=AoSbsc/hDfdLDBchS5CrpKHP8y3li0gSGWS9g2zj9t2e71BV4XyXOfjD7M+dg2BuZX
         O5T21DJx3nybnfVzAdaMcUeIBM9Q/FWJr/b5yHxd8SvORLU5l9sU9IDpsSB8GzFFmzv2
         317dtqSdCCRPMPVBYiklQJhxlL2zG21N7X1Q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ALRsMRpYMQGhTl3M7F2q6n1Ivfp3wJoqu+LD2z2YD60=;
        b=O4dzCwTkySqLZZj0RNs7hUAfRU05EqfKqKOEaLtoB/+DOPZbyp/nag1/7LBVgl7rTK
         MyUOHfR/cD9egyHMUcptq3gkUz75P87v5dpivqAJXGs0zJc8lufZtvn5VDFIjTLl7rZW
         7uRvVp8tVgN8RicHasny5bLI7o9ANk6n6hsGzXUd/LMflqezfwCZPnvTKajDmt6B54N5
         rUKXsWcPz91sWkqqdmOO8MPUXGNHuDv504hJ7Fo4VPgcmXq80qpv5BCHLgcxMXFYXhXS
         q6uAJPd3MKOct3wNVMEae9lWBEjAf5UbOhsYK0GNlCt9q2WArtzQu4BslrXQLBHX3Kxq
         BeLA==
X-Gm-Message-State: AGi0PuZZKo4OVvjg8nXpFlcx0eb701oIeAEj+2+jGq1e2REqb/VXuCPR
        8tOC46BykSSIVJzzpjDStAP9
X-Google-Smtp-Source: APiQypK5D0STJGO/otleIQKVDivq+AWjkI31f6TwNgWwjmsBlQyUopcTpAgGGMfuOQCwVFGmVzgnbg==
X-Received: by 2002:a17:90a:4802:: with SMTP id a2mr2801796pjh.66.1588892751871;
        Thu, 07 May 2020 16:05:51 -0700 (PDT)
Received: from idle.mtv.corp.google.com ([2620:15c:202:1:fe92:d5a8:f1c5:e510])
        by smtp.gmail.com with ESMTPSA id mj2sm738505pjb.49.2020.05.07.16.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 16:05:51 -0700 (PDT)
From:   Matthew Blecker <matthewb@chromium.org>
X-Google-Original-From: Matthew Blecker <matthewb@google.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Matthew Blecker <matthewb@chromium.org>
Subject: [PATCH 0/1] i2c: Add i2c-pseudo driver for userspace I2C adapters.
Date:   Thu,  7 May 2020 16:05:12 -0700
Message-Id: <20200507230513.246804-1-matthewb@google.com>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Matthew Blecker <matthewb@chromium.org>

This patch adds i2c-pseudo, a module that provides I2C adapters backed by
userspace programs. This allows for userspace implementations of
functionality such as tunneling I2C through another communication channel,
or mocking of real I2C devices whose behavior cannot be modeled with
i2c-stub.

Module naming: A pseudo I2C adapter is analogous to a pseudo terminal.

In the Chromium OS ecosystem we are using this for a userspace I2C adapter
built on top of an existing userspace I2C-over-USB implementation used with
embedded debug devices that act as I2C master to a device under test (DUT).
This arrangement is used for interacting with I2C slaves on the DUT,
particularly for transferring firmware to an embedded controller IC which
receives programming via I2C.

That I2C pseudo controller implementation is here:
https://chromium.googlesource.com/chromiumos/third_party/hdctools/+/refs/heads/master/servo/interface/i2c_pseudo.py

Matthew Blecker (1):
  i2c: Add new i2c-pseudo driver for userspace I2C adapters.

 .../i2c/pseudo-controller-interface.rst       |  305 ++
 drivers/i2c/Kconfig                           |   17 +-
 drivers/i2c/Makefile                          |    1 +
 drivers/i2c/i2c-pseudo.c                      | 3198 +++++++++++++++++
 4 files changed, 3520 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/i2c/pseudo-controller-interface.rst
 create mode 100644 drivers/i2c/i2c-pseudo.c

-- 
2.26.2.526.g744177e7f7-goog

