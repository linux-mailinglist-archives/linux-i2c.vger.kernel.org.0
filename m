Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC064A3278
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 00:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353250AbiA2XAr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jan 2022 18:00:47 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:36141 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347650AbiA2XAq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Jan 2022 18:00:46 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id ACE413200BD2;
        Sat, 29 Jan 2022 18:00:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 29 Jan 2022 18:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm1; bh=YkxZLU31+SkUNlHUtOK24HTfoaFsFV9ZeL8fTN7IANU=; b=DN0Cs
        Y0uL7OacJJP6DjMeWSLekJ6lxxoVeNK90E0du8bUpWM2Qgtwmh1Wyke7caOOtuCP
        IpqxXmF+1cbUCQgDyWofmBJ+xt+yeF6wz4xWCBFsHYoLg1JOJesyPaoC9RyjomD0
        GxMScCieoDnO600IrdespphnKXITwGGPtPpBqVCXiu7A2WZNv8qG7oMagfRTAnVe
        lXXTjCCh1bwhKMJAu8BhUZ4XXCWTiY+gvrH1FBHOTbLncv51cM73Z/CxW9A/whbf
        5mysNnrXDADlP//G2XvlYhTicfVlPWyaEfRNasAMrVXlv2s0H6KKJpU4zUh4+u5C
        64jSaDt03T2axw1Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:message-id:mime-version:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=YkxZLU31+SkUNlHUtOK24HTfoaFsF
        V9ZeL8fTN7IANU=; b=f2ozszpEHxp86CgfPJ37x3TzJZOpnxqDEpObalYk9rQYj
        uX8vqPGJyBOocABslqqqnaGAH59lbWqImEDbkmSRcI4z8CE3++1Jrtt5c6MjGT/C
        B4StSLuM5A777OuClAwCwDWDjX4w6A2c/314rh+Pzw4GW7eaNjuiTb9EG5cLfwB1
        ShSzZh9/btJtCGnt7fow7ho7hDd5lz5ACSRzWGzSa/w9ULro6odkUhcQiMWHrwp2
        rAc3vxkB99lA10cdQvlIe3Pooa8URW6lJPA0lf009RkcrWRai9Hgg4XW4ybpNnka
        3SUom63aBPLn7LHj1LWrAY0IWS1MnA+N51Mi1+lXw==
X-ME-Sender: <xms:HMf1YUJjm6ltiifLxT_XCNkDgsFzqxq6KlgfV8g582Eoxdvg7W2WXw>
    <xme:HMf1YUKrJNf0_eetJiqrVFQiYracB8YA2xVItWXSTkpiu-4DpmdC1zZF_zTKWAhkH
    kxX8pIKhqp0jb6nPQ>
X-ME-Received: <xmr:HMf1YUuPsqDVkfY2o_2Vhta85ZJmliyHLXjD8o7a1OppkvXeE7_VsTSeK9RC9VZDoStKEY1_MR4yUBZ07Pdr-lFiFFmTAk4JIdgLChdK7YaU2WwB27yDgWWM1B1UAuF2J_ehqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeejgdduieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeekkeefjeekvdetheejheekvdfgkeeigfffudehudeihfektdetheegiedv
    gfevudenucffohhmrghinhepmhgvghhouhhsrdgtohhmpdhkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgv
    lhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:HMf1YRbRy0COhWV-STAEzQksBuJ0zQdfuzAJC6C_qAvQe1vTWiPGiw>
    <xmx:HMf1YbaOLcX-nE9qCB8wbGuTO6x9QBDVL-J4j5b0fLrZD5vo5EJR1Q>
    <xmx:HMf1YdDjS8c72uamIVrBLZWFPFJZaErZ71oy20sJ_aoeO-dMJ__03Q>
    <xmx:Hcf1Yf6J9zVDXkjaI5xW6Z5p1sFhfpfFG6KKMc0hAe52AAHKgqvX7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Jan 2022 18:00:44 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Ondrej Jirman <x@xff.cz>,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 0/5] Pine64 PinePhone keyboard support
Date:   Sat, 29 Jan 2022 17:00:37 -0600
Message-Id: <20220129230043.12422-1-samuel@sholland.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series adds support for the official keyboard case for the Pine64
PinePhone and PinePhone Pro. This accessory contains a keyboard MCU and
an IP5209 power bank IC. The keyboard MCU firmware[0] is free software.
It exposes the keyboard scan matrix over I2C, and also provides commands
for SMBus access to the IP5209. In order to keep the IP5209 driver[1]
generic, this is modeled as an I2C bus child of the keyboard.

[0]: https://megous.com/git/pinephone-keyboard/about/
[1]: https://lore.kernel.org/lkml/20220129222424.45707-1-samuel@sholland.org/T/


Samuel Holland (5):
  dt-bindings: input: Add the PinePhone keyboard binding
  Input: pinephone-keyboard - Add PinePhone keyboard driver
  Input: pinephone-keyboard - Build in the default keymap
  Input: pinephone-keyboard - Support the proxied I2C bus
  [DO NOT MERGE] arm64: dts: allwinner: pinephone: Add keyboard

 .../input/pine64,pinephone-keyboard.yaml      |  90 ++++
 MAINTAINERS                                   |   6 +
 .../dts/allwinner/sun50i-a64-pinephone.dtsi   |  18 +
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/pinephone-keyboard.c   | 449 ++++++++++++++++++
 6 files changed, 574 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
 create mode 100644 drivers/input/keyboard/pinephone-keyboard.c

-- 
2.33.1

