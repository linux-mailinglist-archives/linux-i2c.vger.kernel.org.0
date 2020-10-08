Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145D8287E38
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 23:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgJHVoo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 17:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgJHVoo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Oct 2020 17:44:44 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F0BC0613D2;
        Thu,  8 Oct 2020 14:44:44 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id c22so10245063ejx.0;
        Thu, 08 Oct 2020 14:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OL8+lmrAXXWLp+r3THXbwOuJFsPpc8Sn/rLcUaGJ2o0=;
        b=AVQ6dqo9sNa/8TQxRe1y96btk3lhED4lonWb4FioNzxOJ3YWRSuPDjUDlgW5dOi93B
         E8sPjPKEqToa+UsF8KZimkwrZcMcDzyvnxY//h9r+e3+9LmSEYIo4k9sdcak3md+iaNh
         ZyWSZUfEkvipVhEjNqHwWiExsKuNbeypdL0BKZmUCf2kOWWRBfHyEdorKFOz2xekLrsJ
         PDyeW2/2i8Wm5x/Qd6O+/qu9hzbXFVKvP4sypMG6Zq6LXJirfwIbYDWgivmUEZ5C4/YO
         oiZr7VFEqLbiQZ5Lex/4tHIYUY8fdU1P6jWrxbzBo4ojJda0T9KiAAaVjborbTxalI1k
         naIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OL8+lmrAXXWLp+r3THXbwOuJFsPpc8Sn/rLcUaGJ2o0=;
        b=gSpHH3ss5PFWtEhV5ovkZCziW6WgGgnKk6UDAjJMAMi+VbFS4UQDzIsAKa5XkHEBU6
         WwH/lhtsm+dAhbhhhnwy87ZRfX69x/i7qfS7e/7W60IRgOMEn0wI2VLhKBJxiLi2kGws
         NyJeXs5/5ZQLM2dQj17Kcruy26E01XfEbNvGaSGdyE5zNeJK0+pj3umg5izYmS/JVuca
         K+oDmPEtZiia2i8VUeVYg2D1PZ2tt5KlNI12r/VR3K5zUzr/7Y0QKm7ar1jMXiYx4Cn5
         eW/29u98qKpgh5pd/SNNpPgKH7MGSGOL+QdBoD0kjJEa+mr2SJTaCSqDLezIXKoBrgTc
         +a2w==
X-Gm-Message-State: AOAM530dvwXWWv5Psd7n/giGwlPnAi1zuVfy054Gf8i5BrohJy/3vD9z
        i2tcVNr+gcCi737QQOmnXhQ=
X-Google-Smtp-Source: ABdhPJzF+Qci1OtJC3oz+/z1/FAYSrNrBvkc4xolg+Nt5Q1mvU4lidSaZfZ7WNFlSOtYUb9Tp5GbeQ==
X-Received: by 2002:a17:906:7c4b:: with SMTP id g11mr6062120ejp.469.1602193483082;
        Thu, 08 Oct 2020 14:44:43 -0700 (PDT)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id i8sm4831800ejg.84.2020.10.08.14.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 14:44:42 -0700 (PDT)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: [PATCH 0/3] Improve Actions Semi Owl I2C driver
Date:   Fri,  9 Oct 2020 00:44:38 +0300
Message-Id: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patchset brings a few improvements to the Actions Semiconductor
Owl I2C driver driver:

- Fixes an issue reported by Mani related to the error handling
- Adds support for atomic transfers
- Enables asynchronous probing, per Mani's suggestion

Please note the first two patches incorporate the review received for
the following patch (which became obsolete now):
https://lore.kernel.org/lkml/b6c56858854805b0f03e29b7dde40b20796d5c93.1599561278.git.cristian.ciocaltea@gmail.com/

Kind regards,
Cristi

Cristian Ciocaltea (3):
  i2c: owl: Clear NACK and BUS error bits
  i2c: owl: Add support for atomic transfers
  i2c: owl: Enable asynchronous probing

 drivers/i2c/busses/i2c-owl.c | 83 +++++++++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 20 deletions(-)

-- 
2.28.0

