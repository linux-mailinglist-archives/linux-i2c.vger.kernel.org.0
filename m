Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66E2E1469B3
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 14:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgAWNv0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 08:51:26 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:46374 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726771AbgAWNv0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 08:51:26 -0500
Received: from [109.168.11.45] (port=47192 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iuctH-000CNg-2A; Thu, 23 Jan 2020 14:51:23 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/28] docs: i2c: rework I2C documentation, part I
Date:   Thu, 23 Jan 2020 14:50:35 +0100
Message-Id: <20200123135103.20540-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

this series is a list of improvements to the I2C documentation.

It started as a simple reordering of index.rst from alphabetical order to a
logical order. Then it grew to a mixture of various improvements to each
section and some cross-section changes.

I wanted to rework all the sections in a unique series, but after covering
about one third of them the number of patches has already grown pretty long
so I'm sending it in its current state. I will continue to cover the rest
of the sections later.

Each patch is quite self-standing, and most are trivial, so have a good
reading.

v2 incorporates many improvements suggested by Jean Delvare and Peter
Rosin. A special thank you to Jean for his very patient and appreciated
review work of _all_ of the 26 patches. Thanks to his work the patches are
now 28. :) Patches 27 and 28 are the new ones.

Luca

Luca Ceresoli (28):
  docs: i2c: sort index logically
  docs: i2c: summary: extend introduction
  docs: i2c: summary: rewrite the "terminology" section
  docs: i2c: call it "I2C" consistently
  docs: i2c: fix typo
  docs: i2c: replace "I2C-transfer" -> "I2C transfer" consistently
  docs: i2c: i2c-protocol: fix kernel-doc function syntax
  docs: i2c: i2c-protocol: properly name start and stop conditions
  docs: i2c: i2c-protocol: remove unneeded colons from table
  docs: i2c: i2c-protocol: use proper names for ACK and NACK
  docs: i2c: smbus: fix link syntax
  docs: i2c: smbus-protocol: properly name start and stop conditions
  docs: i2c: smbus-protocol: remove unneeded colons from table
  docs: i2c: smbus-protocol: use proper names for ACK and NACK
  docs: i2c: smbus-protocol: enable kernel-doc function syntax
  docs: i2c: smbus-protocol: fix kernel-doc function syntax
  docs: i2c: smbus-protocol: fix typo
  docs: i2c: smbus-protocol: fix punctuation
  docs: i2c: smbus-protocol: improve I2C Block transactions description
  docs: i2c: instantiating-devices: fix internal hyperlink
  docs: i2c: instantiating-devices: rearrange static instatiation
  docs: i2c: instantiating-devices: use monospace for sysfs attributes
  docs: i2c: old-module-parameters: fix internal hyperlink
  docs: i2c: old-module-parameters: clarify this is for obsolete kernels
  docs: i2c: old-module-parameters: use monospace instead of ""
  docs: i2c: rename sections so the overall picture is clearer
  docs: i2c: i2c-protocol: use same wording as smbus-protocol
  docs: i2c: writing-clients: properly name the stop condition

 Documentation/i2c/dev-interface.rst         |   24 +-
 Documentation/i2c/dma-considerations.rst    |    2 +-
 Documentation/i2c/i2c-protocol.rst          |   45 +-
 Documentation/i2c/i2c-topology.rst          |   72 +-
 Documentation/i2c/i2c.svg                   | 1341 +++++++++++++++++++
 Documentation/i2c/index.rst                 |   59 +-
 Documentation/i2c/instantiating-devices.rst |  115 +-
 Documentation/i2c/old-module-parameters.rst |   31 +-
 Documentation/i2c/slave-interface.rst       |    4 +-
 Documentation/i2c/smbus-protocol.rst        |  107 +-
 Documentation/i2c/summary.rst               |   62 +-
 Documentation/i2c/writing-clients.rst       |   16 +-
 12 files changed, 1654 insertions(+), 224 deletions(-)
 create mode 100644 Documentation/i2c/i2c.svg

-- 
2.25.0

