Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527411AA42F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 15:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506252AbgDONTk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 09:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2506249AbgDONTg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 09:19:36 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63626C061A0C;
        Wed, 15 Apr 2020 06:19:36 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t11so1475059pgg.2;
        Wed, 15 Apr 2020 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mGivcgEJ6E876yj00y3QoKcNXlu3JKn22U740NPN6wE=;
        b=IfPy7LVHeMGkWmqorJ6OgR3uVTalPLTzftap1Wuz4dA3PVwCzEi0GBWkixQcOITQ/U
         /mx6tx5mAtFfpJr5K8A+uCNfaUXZKsPVrGiGnk+amCKDOLSRySJOPXRK+PdWkN6vnuI7
         XmQsg5tBqG12SCEdkuYUkvSZz+1etZmwx6pqXbcIZlHOPZS4p3D/fTI2wtCl+Gpl9+X/
         AYNFYNeduNCOdLZVzkcJZWRm6poyG/b2bKyQny9VrktjnvNY2LMtsSUn75VwvVcn6OV1
         GD7c6FG8Yobax+jXnwLWKMHtvitBw0bxk9pLzmh20zRreyYASNDTT78JGpADNvwrgkJn
         JVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mGivcgEJ6E876yj00y3QoKcNXlu3JKn22U740NPN6wE=;
        b=DALeLHHyR1nc+dGeA+pKYmIj74Qsne5lce6O+SFs0DnLUonsXsf4kC5zqmOFxVmJS6
         LY6jBR5yN7QTYszSZq7uVXvONJ0iWzBfEZq3jpEhHf/15Ph7okIRbC58Z5dJLHBAs4si
         +Jjdeiq3Zl5oNsYfU2LjQ84NZB18Pa1MM4IpsDrgmGEEHO7hLrASqNGHyU0mWUE7AJtB
         g3HjTswY1EmLDTdk2UEViqucf46RbyvCD2hrw5K3sFaC+iEkeoFsaEqhEHA4Y5kEaMVG
         5flaEes0RUMRFTxoVX7Vt0bHMASvyTdHQeshGlSlEdtMzVUTyRpFXTpzUOFVdQwAnjlR
         yKhQ==
X-Gm-Message-State: AGi0PuZ0FoKabSNNUl9C/f3ksu98pYvGi74UR2kwsN67TtqcF2cWX4zf
        nZgLETlYkB6/58FeNN8LPQRb9ESfJZ1oTw==
X-Google-Smtp-Source: APiQypIBDKrme0mTxDjPnkAwvY8r34Ay4utm2CzhTMzkVCkR+WUfXWBN0Ic/WlLbhdK4/6ew0sMONg==
X-Received: by 2002:a63:1a16:: with SMTP id a22mr20756378pga.264.1586956775700;
        Wed, 15 Apr 2020 06:19:35 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e1c:dc2f:f465:67ce:fbea:c439])
        by smtp.gmail.com with ESMTPSA id r9sm13403346pfg.2.2020.04.15.06.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 06:19:34 -0700 (PDT)
From:   Aishwarya R <aishwaryarj100@gmail.com>
To:     wsa@the-dreams.de
Cc:     aishwaryarj100@gmail.com, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: powermac: Simplify reading the "reg" and "i2c-address" property
Date:   Wed, 15 Apr 2020 18:49:14 +0530
Message-Id: <20200415131916.23555-1-aishwaryarj100@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408100354.17782-1-aishwaryarj100@gmail.com>
References: <20200408100354.17782-1-aishwaryarj100@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>> Use of_property_read_u32 to read the "reg" and "i2c-address" property
>> instead of using of_get_property to check the return values.
>>
>> Signed-off-by: Aishwarya R <aishwaryarj100@gmail.com>

> This is quite a fragile driver. Have you tested it on HW?

This change is not tested with the Hardware.
But of_property_read_u32 is better here than generic of_get_property.
This make sure that value read properly independent of system endianess.
