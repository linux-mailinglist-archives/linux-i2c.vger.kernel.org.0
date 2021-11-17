Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5366F454911
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Nov 2021 15:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235246AbhKQOrX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Nov 2021 09:47:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235555AbhKQOrK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Nov 2021 09:47:10 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30ACC061570
        for <linux-i2c@vger.kernel.org>; Wed, 17 Nov 2021 06:44:11 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id w1so12146936edd.10
        for <linux-i2c@vger.kernel.org>; Wed, 17 Nov 2021 06:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=W3WER5/6W6vthI7bNfLZ0lh+cHQcJpoLM+3p9OAUFoY=;
        b=fO18VvCKvZ9aPZ4Har49cx0UDbq3hxIRxlV0Qe2q74QUHXnMNFiaxl95YZYUxD+FpQ
         nrDW9N8ffknYsUQb6rtncQuSD5VjLF4kpIuB9XRK05g5fDgQzoTG5nbYNglcx/cfJQf3
         yyvbvFjd2xP3fcUQJGPkEjIVl/iDMZt2+HIzwYlMy9JMWZBeIRkunW/Icc2oC3tKONBb
         geD+2bt2FlIISIP+r585M0vhlzb/bxsBzEe2iERqbHHAwyMHzJ1nBi0lvx3wRbu3f+wN
         PVAWgkEF/7CmDcAw8tc15BtVswd5waqkRq2Lim44ov4H8UVCrjeO3rKUzfZ27NR6c9LE
         lkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=W3WER5/6W6vthI7bNfLZ0lh+cHQcJpoLM+3p9OAUFoY=;
        b=viDpokeiJ5eE4Q9eSsEYI+ipdbHHxyq3M7YMTma0rPg0rywZCzfb1sa4/dCstUxB86
         vFM+LuiEa7xT2/6CAnTW0ORchyLq3b24GpE3eLevgxcfAGN5dZuAM68ZpNgHapkASQV/
         OtinarE7kQqAXuVP/YmzUu1L5RVsnFbCsYSQigkryvR0So78yvTL4zT7ppdQ/U4ykoFv
         6J2lNvzBWgPskbClPNE489fKG8tSgpaO3aCYOLJ6LoGTzKXOaGC4/dAZBMMfyQHxaakb
         stgg6/phUu6RazMixXzKEzXdXmnbxo3yQG5ojvAyPi61J1I7bNnhStCQdnITQkvR1rGM
         7JAg==
X-Gm-Message-State: AOAM533nrvPEaQCDpa5Rvxpmt4pMm8TUBwULb1lSKxSGD7E63bocRELr
        uGZEQXKWk9KoFAXPwSlU8XbMSTiSG2n48vCPBxM=
X-Google-Smtp-Source: ABdhPJy/rBKiG87Q0nghrJR/72SeqkVFhuBNiM1rXMuUbaIedPgZ0FUj49/NCnazAvgmqAKkhuaIwMgKU5FNu8xqBtI=
X-Received: by 2002:a05:6402:190c:: with SMTP id e12mr22697398edz.309.1637160250438;
 Wed, 17 Nov 2021 06:44:10 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:907:94c7:0:0:0:0 with HTTP; Wed, 17 Nov 2021 06:44:09
 -0800 (PST)
Reply-To: fionahill.usa@hotmail.com
From:   Fiona Hill <drivanrobert81@gmail.com>
Date:   Wed, 17 Nov 2021 06:44:09 -0800
Message-ID: <CAJp5pik957c=a_qzXcAOEK3A_gij3YgyH-zdJA1V7GrztWpSaw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-- 
Hi,

You receive my message i send to you?
