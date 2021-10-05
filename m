Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAE2421B22
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 02:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhJEAeS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 20:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhJEAeS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Oct 2021 20:34:18 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5163C061745;
        Mon,  4 Oct 2021 17:32:28 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id e24so23918409oig.11;
        Mon, 04 Oct 2021 17:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BhZqZNJ0Z8AdP/BF4tKqqVeWz0lpW5ZW0Of41oO70rM=;
        b=CHe5+rQj8FHa1TVTgumYYJGgqgdMCJirrz+5tEqHccTe4nUWkAqzgFcb3Zxlo4cDlR
         gM+bYqnAHn8UZPC3O3x+AB8HaaxL0uV8gPasMrakr31uoDJGEkxinT64j/BLRtPeVqsI
         wSrk2wuJtyXKyg1yf5dWDXPtuB2Hoxh765UV3xarS3mU1RD5aIm/FfG/toViQY+CxslA
         +xHjxI2uDlXpz8xC39GQsKoXo4hcO6Jzr10Euengg7H3G5iv/VLZOHXJAmTsvQreycwU
         o6St1P48NL97oZhmQs+YXlBXqXXsN/St4VEk340hZiKDwPnDcwowbgdKltphCLEjoTpk
         1D+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=BhZqZNJ0Z8AdP/BF4tKqqVeWz0lpW5ZW0Of41oO70rM=;
        b=36bdXJ/3aF8tXIgyfYx4rd5n+EOQd2Pij3f9fPhrFhRjgxGgfaEpTiT1PGg+zViKP2
         NSyCznpGu9ttDOMHzuZ1SU9A+UnAaV4YvTgDg6dCNcbft6U7YKwL2MTpGC1wY1QBzcsk
         jd0syLkP0+vhZVl4HV9b7BcREYnoPIsWppjc9orLfB0ltdcAugFWvWkoyhNNRX4dasbK
         HOScK708eYLuQURteDAz6ONycm4ek7ryVEM1tGmsKLsJbZf7sX9TVnKixyV9SRuJGlGF
         F8wpJKp2/I5HhbWExWBXqHlJcJtDpHGvkoTxS6PzfS+4qOnVhdkaGcSQ33jwluGaldQW
         gTBg==
X-Gm-Message-State: AOAM532Ngdk3mrQBicI150L8IQoIaVA2oQ/1FwyHGjgx7oUjdV/BKq6K
        CnAbaB6i9EUzLDQwF3zxH1+Mm6ZIFg==
X-Google-Smtp-Source: ABdhPJxSc4jszmWn1ZHdroFM965I92pIFIB98MlY+CIRaXQDpmn4PlAC0nnZ6+h5oszSaYEVv5huxA==
X-Received: by 2002:aca:da04:: with SMTP id r4mr125183oig.56.1633393947997;
        Mon, 04 Oct 2021 17:32:27 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id bj33sm3268814oib.31.2021.10.04.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 17:32:27 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:1ce5:3fb4:8fe9:30d1])
        by serve.minyard.net (Postfix) with ESMTPA id 7E9001800F0;
        Tue,  5 Oct 2021 00:32:26 +0000 (UTC)
From:   minyard@acm.org
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Andrew Manley <andrew.manley@sealingtech.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] i2c:imx: Deliver a timely stop on slave side, fix recv
Date:   Mon,  4 Oct 2021 19:32:13 -0500
Message-Id: <20211005003216.2670632-1-minyard@acm.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I was working on an application that needs the stop condition
immediately.  So this adds a timer after each byte is received/sent and
if the bus is idle at the timeout, send the stop.

Also, I noticed when you use the i2c-slave-eeprom, if you read some data
and then read some data again, the last byte of the first read will be
the first byte of the second read.  This is because i2c-slave-eeprom
expects a read-ahead.  That's what the documentation says, at least.

-corey



