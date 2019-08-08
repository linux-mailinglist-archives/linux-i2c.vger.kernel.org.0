Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0088589B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 05:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730551AbfHHDl7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 23:41:59 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38008 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbfHHDl6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 23:41:58 -0400
Received: by mail-pl1-f193.google.com with SMTP id m12so4306660plt.5
        for <linux-i2c@vger.kernel.org>; Wed, 07 Aug 2019 20:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=CltnQTlt8olc+fDLy2Jnh5hmJd7EG7/QIe5FFgTWxYw=;
        b=gUly2egFnTMEnmQt8hy4Aef/sXt/p2qtK4St243N9Vr8JaIVzaix9GpTB9gDSS6G8n
         VRuJ2gK+MoyQV+7mwOr4R6MqR4Ws4cSm57d5b/k0QfttT7FPqEGGaYmxO9zGVN80KUyf
         Xt7JDRsFKs4Dk255X8jwjb9Q1ycmt/wjj7tng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CltnQTlt8olc+fDLy2Jnh5hmJd7EG7/QIe5FFgTWxYw=;
        b=pW3FUAxYjJATGXQAL9l8xYT8IHCgyZrnIoea80XajurY/H0q5VKO8omxweJeIaTxgU
         B/9CLO7ovECbn8KfrZ0ljAOo9xhpLzqLF9g+cXykl1Q4Pu5lW5m3HOek5oCWmF9+dQCb
         fc6wTg68vqxp9nlTZfMyBJCyLiJzfEct+AxrV1n7VLvyadefn235eayaVeZFyLaklI7H
         +m6j7FnigENuPlYgglpwxnTnOQ8zut4ARK848tTkqrPx2uoz3r7LWHR+o4BT4H9s5pWV
         w5lHOk/4Xqw7R0zF6MHEhGKaqpdNCVEVkAm2lB1RyiA0TnZBStL6v8P1Ut7TzrKKU7pH
         bVDg==
X-Gm-Message-State: APjAAAUseyGdMTHtzGIUkXGicnekNYvKKNF6bY4mNvSmdPWlrjwmoFJW
        JOB7KUxpD3q+qfJzJdilkrKghg==
X-Google-Smtp-Source: APXvYqy1YWfA92bvwxrgj1XPwg6/YN6ruDZmL72kWXbICFTwOBsziMdPWNVG8Od/3aZ4K4bRsaZoCA==
X-Received: by 2002:a17:902:74c4:: with SMTP id f4mr10916411plt.13.1565235717808;
        Wed, 07 Aug 2019 20:41:57 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id y14sm46425482pge.7.2019.08.07.20.41.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 07 Aug 2019 20:41:56 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Ray Jui <ray.jui@broadcom.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v1 0/2] Remove smbus quick cmd and update adapter name
Date:   Thu,  8 Aug 2019 09:07:51 +0530
Message-Id: <1565235473-28461-1-git-send-email-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

This patchset contains following changes:
- Remove SMBUS quick command support
- Update full name of dt node to adapter name

Lori Hikichi (2):
  i2c: iproc: Stop advertising support of SMBUS quick cmd
  i2c: iproc: Add full name of devicetree node to adapter name

 drivers/i2c/busses/i2c-bcm-iproc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
1.9.1

