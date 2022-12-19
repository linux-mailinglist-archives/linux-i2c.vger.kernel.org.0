Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6BC665118C
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 19:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbiLSSMt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 13:12:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiLSSMs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 13:12:48 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0857ED68
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:12:43 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id s5so14031053edc.12
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpjVCdskuM3x0b9oV7E/nxXgArWlw7r5o9FXdcGvqCo=;
        b=H4PwBCI6gPEG990orcB8hFeoLVMO8/2xZcF1BhrGP3dfX24y9es36aZKKyq5QqRJuI
         fCJEIZ2ETBCsrvWQIJCNAbOBQM+z31CweY9bliY8oPHDg+ok6LX4yPHSVJga0KbnAsOl
         jnDvnAqfQdJPlsvvS4WEpVTgDAnf30clWzCNbUwCPHvZJtuaqIJwf/AQ7TkXkTCJORJC
         YEK5B7YwX/hXQVPWjWfwFlRzU15drzHJ/6CwTx/cc/MO0u1tKiX+InG0HDU8q6RSALOT
         Xxwb4lXl9aJp/WvzbQNQWZympq+h11g+IZt40vPBYJxfYNnoTc2jI9K0aM7My0uzUEWR
         u1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zpjVCdskuM3x0b9oV7E/nxXgArWlw7r5o9FXdcGvqCo=;
        b=0mfWNd35X/LRAO7RLOAbmkN7AwJYXdZuln6zlJ4Yff036u9uaaWAajIkMgk0oIJtz2
         mHDBKhG1vMwtBYm2cgTMqTpViRddXD8fttd2t5H8iUxXdcPHGIu76DA/RN8AScLzaHca
         IOQY1nWbscdpaG5DCSzBqRLvWieq0a0a30Po/K1su9t7cKECIiy84p9ToB5+FCg8D8lF
         BJCpTT379RRPp9BaUtgUEskDfxudJPhCd1KTq/43ObfSST3ilRZ0EtkWij2WnVyngS0O
         O/E9b9ZI4SZHHJLjtbrUqnvTWwzOgrqkTlLdMSs2ejGihRPGBdh06civ7jyXWtYWCaKm
         Sp5Q==
X-Gm-Message-State: ANoB5pnhVcAs6YZ74+DlvAef5Xw4508zbYd5vfbqcFZ8msKzzOC/TUGp
        Dh1oeECfJji4bw+ksNY4oorjwSHfvL4=
X-Google-Smtp-Source: AA0mqf5OXS/Sm8vq2v3QUwubw0nMlc8FDv4/v0dG6zHs5GnbupjswNVJ2S2DE5OTM+y//qDf3Jwl1A==
X-Received: by 2002:a05:6402:3224:b0:46c:d2a3:76b3 with SMTP id g36-20020a056402322400b0046cd2a376b3mr42285641eda.14.1671473561395;
        Mon, 19 Dec 2022 10:12:41 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0aa:f200:2422:8cf4:48af:d322? (dynamic-2a01-0c23-c0aa-f200-2422-8cf4-48af-d322.c23.pool.telefonica.de. [2a01:c23:c0aa:f200:2422:8cf4:48af:d322])
        by smtp.googlemail.com with ESMTPSA id n1-20020a05640206c100b0046150ee13besm4587899edy.65.2022.12.19.10.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 10:12:41 -0800 (PST)
Message-ID: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
Date:   Mon, 19 Dec 2022 19:12:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Language: en-US
Subject: [PATCH v2 00/10] i2c: i801: Series with minor improvements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series includes a number of minor improvements, partially it's
a re-send of patches submitted in December last year already.

Changes in v2:
patch 1
- change one expression for generating less binary code
patch 2
- add a commit message part as comment to the code
- make changed code cleaner
patch 3
- add a commit message part as comment to the code
original patch 4
- dropped
patch 4 (previously patch 5)
- change expressions for generating less binary code
patch 5  (previously patch 6)
- rename new function to i801_simple_transaction
- code style fixes
patch 6
- added
patch 7
- added based on a suggestion in  a review comment
patch 8
- added based on a suggestion in  a review comment

Heiner Kallweit (10):
  i2c: i801: improve interrupt handler
  i2c: i801: make FEATURE_HOST_NOTIFY dependent on FEATURE_IRQ
  i2c: i801: make FEATURE_BLOCK_PROC dependent on FEATURE_BLOCK_BUFFER
  i2c: i801: add helper i801_set_hstadd()
  i2c: i801: add i801_simple_transaction(), complementing
    i801_block_transaction()
  i2c: i801: handle SMBAUXCTL_E32B in i801_block_transaction_by_block
    only
  i2c: i801: centralize configuring non-block commands in
    i801_simple_transaction
  i2c: i801: centralize configuring block commands in
    i801_block_transaction
  i2c: i801: call i801_check_pre() from i801_access()
  i2c: i801: call i801_check_post() from i801_access()

 drivers/i2c/busses/i2c-i801.c | 311 +++++++++++++++++-----------------
 1 file changed, 153 insertions(+), 158 deletions(-)

-- 
2.39.0

