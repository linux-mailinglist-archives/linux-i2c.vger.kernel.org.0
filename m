Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32FEEC485D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2019 09:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfJBHUy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Oct 2019 03:20:54 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34461 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfJBHUy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Oct 2019 03:20:54 -0400
Received: by mail-wr1-f65.google.com with SMTP id a11so18327530wrx.1
        for <linux-i2c@vger.kernel.org>; Wed, 02 Oct 2019 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I5mMX5EtUi8CNbu12Q9es5bMrtSxH0QcA+G46hT8nEk=;
        b=GmwYcG1xRM7oCgwZMxdz8kS0k/HgCjChHWiSixwcSHU7CE/xVd6kYvQAHnXPxauChG
         gzgIrnoxWDzc0w6XQu9JbpYPY0gEKwRCO3iaGyK5yS/jPzSMvWWPHfC3qa1PqmlmrkCk
         I56oxAHzTAMHUJePLW667evPLYYV0+jd14mPyzBW5WBQR8pMuyn5qpaCAx2/z+g8abec
         eZOba+wk9l/pUXanDazIhzt1ljlV9P/YOWEOlfruaxublHe0QvkNHon6ufhaDHzUJ4Hk
         oPZTnE9dgs8qaY/jhIbsRzjSLEAeRDXyMAbgzQo+xZWbMi6um2NuahWs36OKVpC6wSiP
         F9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I5mMX5EtUi8CNbu12Q9es5bMrtSxH0QcA+G46hT8nEk=;
        b=hw1K5QW2qWI8UwWMuB3aMdlT3W5sGxZ5Wp76fEg0IYO76f43ePtWB0fkOQqZ8atuuC
         t3eXuXorU89oes6wZSxL83RG95SgylQW6rqI6j4QT/q3dcIPquazVxWs0y1hwYk5XxdZ
         0a4hfSgWCLV2qbeGRrNUc0Ha+MCt0aYUQLeKdEhbtUJ/sJ3hpIo/TWoxSqFohBsnti1E
         xDXylVElZJPITDhWDwVfbvZcg6hsOR+lRyRpySY9n5XgSKg2q63PXLG/a+rHGtguA+1i
         zlysDhH9xR6mudoOa3y7Bm3e9vfRn1zNkkUls34hxcHA0RGbE3a2lZztic/hOGCl89Tl
         uxdg==
X-Gm-Message-State: APjAAAWVRQVAiCQ/n2MyWW9PfGGTrTtatTj3VUZ6lzZbXwQBEhjqZdLI
        SK/Zq8eDGIy8rtrd319yxmE3EA==
X-Google-Smtp-Source: APXvYqyLndtFY5nV6iky84P19MJ6vsM4+DVhKRevPzYk9ocz+Ooq2niL0Ty+HsoJ4cGaRyJJSlrZtA==
X-Received: by 2002:a5d:490f:: with SMTP id x15mr1337565wrq.375.1570000851693;
        Wed, 02 Oct 2019 00:20:51 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id n18sm3850640wmi.20.2019.10.02.00.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 00:20:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Rosin <peda@axentia.se>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v6 0/2] at24: convert the binding document to yaml
Date:   Wed,  2 Oct 2019 09:20:45 +0200
Message-Id: <20191002072047.20895-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The first patch converts the at24 DT binding to yaml. The second adds a new
compatible special case that's being used undocumented currently.

v1 -> v2:
- modified the compatible property: we now list all possible combinations and
  non-standard types with appropriate fallbacks to be as strict as possible
- minor changes to other properties: added constraints, converted to enums
  where applicable and referenced the types from schema

v2 -> v3:
(Rob Herring:)
- Here's my reworking of compatible schema and all the other fixes I
  found. The inner 'oneOf' is probably a little excessive given the number
  of lines. All it does is ensure both compatible strings have the same
  part number.

v3 -> v4:
- Add a $nodename definition
- Turns out the compatible schema is too complex for generating a 'select'
  schema and only a small subset where getting validated. So we need a
  custom 'select' schema. This in turn fixes the issue with the nxp,se97b
  binding.

v4 -> v5:
- added a new patch extending the list of special cases of the compatible
  property
- added comments explaining the schema for the compatible property
- dropped redundant information from property descriptions (for instance:
  there's no need to say "This parameterless property" where it's obvious
  from the type that the property is a flag)

v5 -> v6:
- common 'compatible' schema prevents non-unique compatible items, so remove
  that part of the comment
- add missing cs and mac variants to the list of patterns

Bartosz Golaszewski (2):
  dt-bindings: at24: convert the binding document to yaml
  dt-bindings: at24: add new compatible

 .../devicetree/bindings/eeprom/at24.txt       |  90 +--------
 .../devicetree/bindings/eeprom/at24.yaml      | 188 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 190 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/eeprom/at24.yaml

-- 
2.23.0

