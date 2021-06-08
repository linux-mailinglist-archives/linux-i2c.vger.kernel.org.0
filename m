Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8F239FA57
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 17:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbhFHPZx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 11:25:53 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:50606 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhFHPZd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 11:25:33 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 66F2E219C4;
        Tue,  8 Jun 2021 15:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623165819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=m7SkvhDJYjhIqs/TGZRZ9+zZiVlQqOJz/x5h/Ljnld4=;
        b=fm1Kdb//NWkPAEcRAeiczsNH+I0YbBRx7JQuJA1WqOwAiEoDFOeP2ZCXPJhJvtl7Cy6Ca+
        dau1wsFrC0gM9ZfllCBsDpffC0HDQfnJgvK6xwipTr9uVwQYjUyoZTjx+q1B042h7AiU9A
        PqM/vxNr4CBzvgenU+0L0rLQdBwe1Bc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623165819;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=m7SkvhDJYjhIqs/TGZRZ9+zZiVlQqOJz/x5h/Ljnld4=;
        b=ulmRUmPJIrbhY5W77NzLLU8pHMXE5IjnVDq4Ie9MwGcrdCmp1H14p06Gz08vhF162+vL+j
        2+FOXasNhAwXoMAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 30152118DD;
        Tue,  8 Jun 2021 15:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623165819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=m7SkvhDJYjhIqs/TGZRZ9+zZiVlQqOJz/x5h/Ljnld4=;
        b=fm1Kdb//NWkPAEcRAeiczsNH+I0YbBRx7JQuJA1WqOwAiEoDFOeP2ZCXPJhJvtl7Cy6Ca+
        dau1wsFrC0gM9ZfllCBsDpffC0HDQfnJgvK6xwipTr9uVwQYjUyoZTjx+q1B042h7AiU9A
        PqM/vxNr4CBzvgenU+0L0rLQdBwe1Bc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623165819;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=m7SkvhDJYjhIqs/TGZRZ9+zZiVlQqOJz/x5h/Ljnld4=;
        b=ulmRUmPJIrbhY5W77NzLLU8pHMXE5IjnVDq4Ie9MwGcrdCmp1H14p06Gz08vhF162+vL+j
        2+FOXasNhAwXoMAg==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id dJbMCXuLv2DcLwAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Tue, 08 Jun 2021 15:23:39 +0000
Date:   Tue, 8 Jun 2021 17:23:38 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Crestez Dan Leonard <leonard.crestez@intel.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 0/7] Rework block read support among i2cget and i2cdump
Message-ID: <20210608172338.0cf520a1@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

This is my attempt to improve the block read support in i2c-tools,
specifically i2cget and i2cdump. The base of this series is the
submission by Crestez Dan Leonard 5 years ago. Sorry for the delay ;-)

First we add support of both I2C and SMBus block read to i2cget:

[PATCH 1/7] i2cget: Add support for I2C block data
[PATCH 2/7] i2cget: Document the support of I2C block reads
[PATCH 3/7] i2cget: Add support for SMBus block read

Then we add support for range selection in I2C block mode to i2cdump:

[PATCH 4/7] i2cdump: Remove dead code
[PATCH 5/7] i2cdump: Add range support with mode i (I2C block)

Lastly we deprecate and eventually remove support for SMBus block mode
from i2cdump:

[PATCH 6/7] i2cdump: Deprecate SMBus block mode
[PATCH 7/7] i2cdump: Remove support for SMBus block mode

The idea would be to get the first 6 patches in the upcoming i2c-tools
v4.3, and apply the 7th patch "later" (either immediately after that
release, or some time later, I'm not sure).

-- 
Jean Delvare
SUSE L3 Support
